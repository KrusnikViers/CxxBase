#include <fstream>
#include <cstdio>

#include "gtest/gtest.h"

#include "cxxbase.h"

INITIALIZE_EASYLOGGINGPP

TEST(LoggingTest, TestLoggingBasic) {
  const std::string kLogFileName = "cxxbase_test_log.txt";

  // Set up some testing logger configuration.
  el::Configurations defaultConf;
  defaultConf.setToDefault();
  defaultConf.set(el::Level::Info, el::ConfigurationType::Format,
                  "%level %msg");
  defaultConf.set(el::Level::Error, el::ConfigurationType::Format, "%msg");
  defaultConf.setGlobally(el::ConfigurationType::ToFile, "true");
  defaultConf.setGlobally(el::ConfigurationType::Filename, kLogFileName);
  el::Loggers::reconfigureLogger("default", defaultConf);

  // Check that common types stringified as well.
  const int kTestInteger = 13;
  const char kTestChar = 'z';
  const double kTestDouble = 3.14159;

  LOG(INFO) << "1, 2, 3";
  LOG(ERROR) << kTestChar << ", " << kTestInteger;
  LOG(INFO) << kTestDouble;

  // Check file contents.
  std::ifstream infile(kLogFileName);
  std::string tmp;
  EXPECT_TRUE(std::getline(infile, tmp));
  EXPECT_EQ("INFO 1, 2, 3", tmp);
  EXPECT_TRUE(std::getline(infile, tmp));
  EXPECT_EQ("z, 13", tmp);
  EXPECT_TRUE(std::getline(infile, tmp));
  EXPECT_EQ("INFO 3.14159", tmp);

  std::remove(kLogFileName.data());
}