#include <string>

namespace lms_service {
    struct CourseData {
        std::string title;
        std::string start_ts;
        std::string end_ts;
        std::string description;
    };
}
