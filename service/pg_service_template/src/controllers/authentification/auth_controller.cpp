#include "auth_controller.hpp"

#include "../../models/auth/token_model.hpp"

namespace lms_service {
    std::string AuthController::GetUserIdByToken(const lms_service::Token& token) {
        return token.data;
    }
}