/*
 * coloring the pointcloud with the image 
 */

#include <cstdlib>
#include <cstdio>
#include <boost/foreach.hpp>
#include <math.h>
#include "opencv2/opencv.hpp"
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/common/eigen.h>
#include <pcl/common/transforms.h>


// offline process the recorded data 
#define USE_RECORDED_FILES 1
#define USE_ONLY_XYZ	   1


using namespace std;
using namespace cv;
using namespace pcl;

/*  
string CAMERA_FRAME_TOPIC;
string CAMERA_INFO_TOPIC;
string VELODYNE_TOPIC;
string VELODYNE_COLOR_TOPIC;


pcl::PointCloud<Velodyne::Point> origin_pc;

#ifdef USE_ONLY_XYZ
pcl::PointCloud<pcl::PointXYZ> visible_points;
#else
pcl::PointCloud<Velodyne::Point> visible_points;
#endif
//float DoF[6] = {0.0503676, -0.14093, -0.0114802, -0.00142857, -0.00428571, 0.01};
std::vector<float> DoF;


//  Mat empty = Mat::zeros(frame.size(), CV_8UC1);

  Mat result_channel(frame.size(), CV_8UC3);
  Mat in[] = {image, plane};
  int from_to[] = {0, 0, 1, 1, 2, 2};
  mixChannels(in, 2, &result_channel, 1, from_to, 3);
  cv::imwrite("mixChannels.png", result_channel);
  return result_channel;
 
*/

static cv::Vec3b atf(cv::Mat rgb, cv::Point2f xy_f)
{
    cv::Vec3i color_i;
    color_i.val[0] = color_i.val[1] = color_i.val[2] = 0;

    int x = xy_f.x;
    int y = xy_f.y;

    for (int row = 0; row <= 1; row++)
    {
		for (int col = 0; col <= 1; col++)
		{
			cv::Vec3b c = rgb.at<cv::Vec3b>(cv::Point(x + col, y + row));
			
			color_i.val[0] += c.val[0];
			color_i.val[1] += c.val[1];
			color_i.val[2] += c.val[2];
		}
    }

    cv::Vec3b color;
	
	color.val[0] = color_i.val[0] / 4;
	color.val[1] = color_i.val[1] / 4;
	color.val[2] = color_i.val[2] / 4;
    
	return color;
}


static cv::Point2f projectfo(const PointXYZI &pt, const cv::Mat &extrinsic, const cv::Mat &intrinsic, float d[4])
{
	cv::Mat pt_3D(4, 1, CV_32FC1);

	pt_3D.at<float>(0) = pt.x;
	pt_3D.at<float>(1) = pt.y;
	pt_3D.at<float>(2) = pt.z;
	pt_3D.at<float>(3) = 1.0f;//is homogenious coords. the point's 4. coord is 1

	cv::Mat pt_2D = extrinsic * pt_3D;

	float w = pt_2D.at<float>(2);
	float x = pt_2D.at<float>(0) / w;
	float y = pt_2D.at<float>(1) / w;

	//	add distortion
	float r2 = x*x + y*y;
	float r4 = r2 * r2;

	float xd = x*(1 + d[0]*r2 + d[1]*r4) + 2*d[2]*x*y + d[3]*(r2 + 2*x*x);
	float yd = y*(1 + d[0]*r2 + d[1]*r4) + 2*d[3]*x*y + d[2]*(r2 + 2*y*y);
	//std::cout << xd - x << std::endl;

	// image coordinates
	x = intrinsic.at<float>(0, 0)*x + intrinsic.at<float>(0, 2);
	y = intrinsic.at<float>(1, 1)*y + intrinsic.at<float>(1, 2);

	return cv::Point2f(x, y);
}


static cv::Point2f projectfo(const PointXYZ &pt, const cv::Mat &extrinsic, const cv::Mat &intrinsic, float d[4])
{
	cv::Mat pt_3D(4, 1, CV_32FC1);

	pt_3D.at<float>(0) = pt.x;
	pt_3D.at<float>(1) = pt.y;
	pt_3D.at<float>(2) = pt.z;
	pt_3D.at<float>(3) = 1.0f;//is homogenious coords. the point's 4. coord is 1

	cv::Mat pt_2D = extrinsic * pt_3D;

	float w = pt_2D.at<float>(2);
	float x = pt_2D.at<float>(0) / w;
	float y = pt_2D.at<float>(1) / w;

//	add distortion
	float r2 = x*x + y*y;
	float r4 = r2 * r2;

	float xd = x*(1 + d[0]*r2 + d[1]*r4) + 2*d[2]*x*y + d[3]*(r2 + 2*x*x);
	float yd = y*(1 + d[0]*r2 + d[1]*r4) + 2*d[3]*x*y + d[2]*(r2 + 2*y*y);

	//std::cout << xd - x << std::endl;
	// image coordinates
	x = intrinsic.at<float>(0, 0)*xd + intrinsic.at<float>(0, 2);
	y = intrinsic.at<float>(1, 1)*yd + intrinsic.at<float>(1, 2);

	return cv::Point2f(x, y);
}



PointCloud<PointXYZRGB> colouring(pcl::PointCloud<PointXYZI> &pc, 
		                          cv::Mat& frame_rgb, cv::Mat& extrinsic, cv::Mat& intrinsic, float distortion[4])
{
	PointCloud<PointXYZRGB> color_cloud;
	unsigned int Cols = frame_rgb.cols;
	unsigned int Rows = frame_rgb.rows;

	for (pcl::PointCloud<pcl::PointXYZI>::iterator pt=pc.begin(); pt<pc.end(); pt++)
	{
		Point2f xy = projectfo(*pt, extrinsic, intrinsic, distortion);
		
		if( xy.x >= 0 && xy.x < Cols && xy.y >= 0 && xy.y < Rows)
		{
			Vec3b rgb = atf(frame_rgb, xy);
			PointXYZRGB pt_rgb(rgb.val[2], rgb.val[1], rgb.val[0]);
			pt_rgb.x = pt->x;
			pt_rgb.y = pt->y;
			pt_rgb.z = pt->z;

			color_cloud.push_back(pt_rgb);
		}
	}
	return color_cloud;
}

PointCloud<PointXYZRGB> colouring(pcl::PointCloud<PointXYZ> &pc, 
		                          cv::Mat& frame_rgb, cv::Mat& extrinsic, cv::Mat& intrinsic, float distortion[4])
{
	PointCloud<PointXYZRGB> color_cloud;
	unsigned int Cols = frame_rgb.cols;
	unsigned int Rows = frame_rgb.rows;

	for (pcl::PointCloud<pcl::PointXYZ>::iterator pt=pc.begin(); pt<pc.end(); pt++)
	{
		Point2f xy = projectfo(*pt, extrinsic, intrinsic, distortion);
		
		if( xy.x >= 0 && xy.x < Cols && xy.y >= 0 && xy.y < Rows)
		{
			Vec3b rgb = atf(frame_rgb, xy);
			PointXYZRGB pt_rgb(rgb.val[2], rgb.val[1], rgb.val[0]);
			pt_rgb.x = pt->x;
			pt_rgb.y = pt->y;
			pt_rgb.z = pt->z;

			color_cloud.push_back(pt_rgb);
		}
	}
	return color_cloud;
}




int main(int argc, char** argv)
{
	cv::Mat intrinsic;
	cv::Mat extrinsic;
	cv::Mat img; 
	std::cout << "Loading camera image... " << std::endl;
	img = cv::imread("left_17.png");
	if(img.empty())
	{
		std::cout << "error load image" << std::endl;
		return -1;
	}
	
	pcl::PointCloud<pcl::PointXYZI> pc_xyzi;

	//* load the pointcloud
	if (pcl::io::loadPCDFile<pcl::PointXYZI> ("cloud17.pcd", pc_xyzi) == -1)
	{
		PCL_ERROR ("Couldn't read file pcd \n");
		return (-1);
	}
	std::cout << pc_xyzi.width * pc_xyzi.height << "points Loaded" << std::endl;

	float p[9] = { 700.5756,         0., 644.1857,
	            	      0.,  700.5844, 347.3933,
						  0.,        0., 1.0};
	cv::Mat(3, 3, CV_32FC1, &p).copyTo(intrinsic);
  

	float e[16] = { 0.9990, -0.0430, 0.0147, 0.1169170,
					0.0154, 0.0166, -0.9997, -0.0499314,
					0.0428, 0.9989,  0.0173, -0.2737781,
					0.0,    0.0,     0.0,    1.0};
	cv::Mat(4, 4, CV_32FC1, &e).copyTo(extrinsic);

	float distortion[4] = {-0.173361922215230, 0.025608197114975, -0.000352813925344, 0.000446588643795};

	std::cout << "extrinsic" << extrinsic << std::endl;


	PointCloud<PointXYZRGB> color_cloud 
        = colouring(pc_xyzi, img, extrinsic, intrinsic, distortion);

	pcl::io::savePCDFile("color_cloud.pcd", color_cloud);
  return 0;
}





/*  

#else

void pointCloudCallback(const sensor_msgs::PointCloud2ConstPtr& msg)
{

  // if no rgb frame for coloring:
  if (frame_rgb.data == NULL)
  {
    return;
  }

  pcl::PointCloud<Velodyne::Point> pc;
  pcl::PointCloud<Velodyne::Point> tmp;
  pcl::PointCloud<Velodyne::Point> new_cloud;


  fromROSMsg(*msg, pc);
  Eigen::Affine3f transf1 = getTransformation(0, 0, 0, M_PI / 2, -M_PI/2, 0);
  Eigen::Affine3f transf2 = getTransformation(DoF[0], DoF[1], DoF[2],
		                                      DoF[3], DoF[4], DoF[5]);
  transformPointCloud(pc, tmp, transf1);
  transformPointCloud(tmp, new_cloud, transf2);

  Image::Image img(frame_rgb);

  project( new_cloud, frame_rgb, projection_matrix );

  Velodyne::Velodyne visible_scan(visible_points);

  PointCloud<PointXYZRGB> color_cloud 
                           = visible_scan.colour(frame_rgb, projection_matrix);

  // reverse axix switching:
  Eigen::Affine3f transf = getTransformation(0, 0, 0, -M_PI / 2, 0, 0);
  transformPointCloud(color_cloud, color_cloud, transf);

  sensor_msgs::PointCloud2 color_cloud2;
  toROSMsg(color_cloud, color_cloud2);
  color_cloud2.header = msg->header;


  pub.publish(color_cloud2);

//  std::cout <<" color cloud published!" << std::endl;
}


void cameraInfoCallback(const sensor_msgs::CameraInfoConstPtr& msg)
{
  float p[12];
  float *pp = p;
  for (boost::array<double, 12ul>::const_iterator i = msg->P.begin();
                                                  i != msg->P.end(); i++)
  {
    *pp = (float)(*i);
    pp++;

  }

  cv::Mat(3, 4, CV_32FC1, &p).copyTo(projection_matrix);
}


void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
  cv_bridge::CvImagePtr cv_ptr =
                 cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
  frame_rgb = cv_ptr->image;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "coloring_node");

  ros::NodeHandle n;
  n.getParam("/but_calibration_camera_velodyne/camera_frame_topic",
             CAMERA_FRAME_TOPIC);
  n.getParam("/but_calibration_camera_velodyne/camera_info_topic",
             CAMERA_INFO_TOPIC);
  n.getParam("/but_calibration_camera_velodyne/velodyne_topic",
             VELODYNE_TOPIC);
  n.getParam("/but_calibration_camera_velodyne/velodyne_color_topic",
             VELODYNE_COLOR_TOPIC);
  n.getParam("/but_calibration_camera_velodyne/6DoF", DoF);

  pub = n.advertise<sensor_msgs::PointCloud2>(VELODYNE_COLOR_TOPIC, 1);

  // Subscribe input camera image
  image_transport::ImageTransport it(n);
  image_transport::Subscriber sub = 
                it.subscribe(CAMERA_FRAME_TOPIC, 10, imageCallback);

  ros::Subscriber info_sub = 
              n.subscribe(CAMERA_INFO_TOPIC, 10, cameraInfoCallback);

  ros::Subscriber pc_sub =
   n.subscribe<sensor_msgs::PointCloud2>(VELODYNE_TOPIC, 1, pointCloudCallback);

  ros::spin();

  return EXIT_SUCCESS;
}

#endif

*/
