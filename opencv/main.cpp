#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

int main(int argc, char *argv[])
{
  cv::Mat img = cv::imread("Lenna.png");
  cv::imshow("imshow",img);
  cv::waitKey(0);
  return 0;
}
