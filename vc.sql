/*
 Navicat Premium Data Transfer

 Source Server         : hello
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : vc

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 18/01/2019 09:15:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `ins_id` int(11) NULL DEFAULT NULL,
  `projectDel` bit(1) NULL DEFAULT NULL,
  `projectAdd` bit(1) NULL DEFAULT NULL,
  `projectEdit` bit(1) NULL DEFAULT NULL,
  `projectInfo` bit(1) NULL DEFAULT NULL,
  `fundAdd` bit(1) NULL DEFAULT NULL,
  `fundDel` bit(1) NULL DEFAULT NULL,
  `fundEdit` bit(1) NULL DEFAULT NULL,
  `fundInfo` bit(1) NULL DEFAULT NULL,
  ` investorAdd` bit(1) NULL DEFAULT NULL,
  `investorDel` bit(1) NULL DEFAULT NULL,
  `investorEdit` bit(1) NULL DEFAULT NULL,
  `investorInfo` bit(1) NULL DEFAULT NULL,
  `fileUpload` bit(1) NULL DEFAULT NULL,
  `fileDown` bit(1) NULL DEFAULT NULL,
  `fileDel` bit(1) NULL DEFAULT NULL,
  `fileCreateDir` bit(1) NULL DEFAULT NULL,
  `roleUpdate` bit(1) NULL DEFAULT NULL,
  `roleAdd` bit(1) NULL DEFAULT NULL,
  `roleDel` bit(1) NULL DEFAULT NULL,
  `roleInvitation` bit(1) NULL DEFAULT NULL,
  `roleDelUser` bit(1) NULL DEFAULT NULL,
  `taskInfo` bit(1) NULL DEFAULT NULL,
  `taskAdd` bit(1) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `default` bit(1) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (40, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 130, b'0');
INSERT INTO `authority` VALUES (41, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 130, b'0');
INSERT INTO `authority` VALUES (102, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 130, b'0');
INSERT INTO `authority` VALUES (104, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 130, b'0');
INSERT INTO `authority` VALUES (103, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 130, b'0');
INSERT INTO `authority` VALUES (0, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', 0, b'1');

-- ----------------------------
-- Table structure for byinviteinss
-- ----------------------------
DROP TABLE IF EXISTS `byinviteinss`;
CREATE TABLE `byinviteinss`  (
  `id` int(255) NOT NULL,
  `by_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `msg` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of byinviteinss
-- ----------------------------
INSERT INTO `byinviteinss` VALUES (1, '110', 130, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (2, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('9704986ccd219617674e7901451bd78f426d32f1f56f0cd6ca9428dd3d17dd1e6588d5d74018196f', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:00:47', '2018-12-18 11:00:47', '2019-12-18 11:00:47');
INSERT INTO `oauth_access_tokens` VALUES ('0b0325e670c106dee73e104f4a80ddfc774e125be6058ee0eb4af30249624ad211aa2bcfe2afc2c2', 1, 1, 'MyApp', '[]', 0, '2018-12-18 10:58:45', '2018-12-18 10:58:45', '2019-12-18 10:58:45');
INSERT INTO `oauth_access_tokens` VALUES ('c257228fb971814638e4824c58662f12444f70236801e6d27aea9a9cafd9ae869193eb53452e8b98', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:02:15', '2018-12-18 11:02:15', '2019-12-18 11:02:15');
INSERT INTO `oauth_access_tokens` VALUES ('bc79c58ccc158b3632c8959eb5a5d637a6ee2a51358ccecea112f1ba9605f8534877d2b68642551d', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:02:35', '2018-12-18 11:02:35', '2019-12-18 11:02:35');
INSERT INTO `oauth_access_tokens` VALUES ('4051fc323ff2b9a5d54c988bf4756028940fc1442faa2a05d6e6a937ac9a5e744ebd2cc728a08c7c', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:02:44', '2018-12-18 11:02:44', '2019-12-18 11:02:44');
INSERT INTO `oauth_access_tokens` VALUES ('70d1dce764c4fb514fe5d3f9621e3ca22973a0847fb1e333394373ecfac0180a3f5afe225532464b', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:03:04', '2018-12-18 11:03:04', '2019-12-18 11:03:04');
INSERT INTO `oauth_access_tokens` VALUES ('be207fa5ee001878b4f677f223311674c48345848a166f11454ee554c015240df0572309b74deaa5', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:03:27', '2018-12-18 11:03:27', '2019-12-18 11:03:27');
INSERT INTO `oauth_access_tokens` VALUES ('22a3422831463d24d53c2e770e5c3178747b88d185558ed7cd567884c0ed83fe4dc3cbb8deb124cb', 1, 1, 'MyApp', '[]', 0, '2018-12-18 11:03:43', '2018-12-18 11:03:43', '2019-12-18 11:03:43');
INSERT INTO `oauth_access_tokens` VALUES ('de9b430029a44d11e2409af26b5ee73f9c7178ae2c0cb20c34b6f84e67444e5039dee16387dcde91', 22, 1, 'MyApp', '[]', 0, '2019-01-09 08:21:43', '2019-01-09 08:21:43', '2020-01-09 08:21:43');
INSERT INTO `oauth_access_tokens` VALUES ('e77c05446c59ff96278c7cdbbda5eec1251179165b1986eff02f62858904eb9a14eef58edaf8eb4c', 23, 1, 'MyApp', '[]', 0, '2019-01-09 08:23:04', '2019-01-09 08:23:04', '2020-01-09 08:23:04');
INSERT INTO `oauth_access_tokens` VALUES ('8505eda77d61479fc91fe1505b2d0c147f5a36b760b2ba34cf2a773cf540f2ec88b78d6810e6d93d', 24, 1, 'MyApp', '[]', 0, '2019-01-09 08:26:06', '2019-01-09 08:26:06', '2020-01-09 08:26:06');
INSERT INTO `oauth_access_tokens` VALUES ('6fbafa001f9c446cd8c1bf1edbca23b8601de36b76c86236001e2c0c5305af69f642c6ace5a86bf2', 25, 1, 'MyApp', '[]', 0, '2019-01-09 08:28:06', '2019-01-09 08:28:06', '2020-01-09 08:28:06');
INSERT INTO `oauth_access_tokens` VALUES ('3258c692900e4e8d7f67926373d2c76734dff97d1a51e2cf8c62b6065d2d43cc19d93fbe2230a89a', 26, 1, 'MyApp', '[]', 0, '2019-01-09 08:29:31', '2019-01-09 08:29:31', '2020-01-09 08:29:31');
INSERT INTO `oauth_access_tokens` VALUES ('6efaf9af9d1a58b5148a5321f4bf4798a143f5c388543cc4e62e9b33031b8614ff8e675120a3e337', 27, 1, 'MyApp', '[]', 0, '2019-01-09 08:31:38', '2019-01-09 08:31:38', '2020-01-09 08:31:38');
INSERT INTO `oauth_access_tokens` VALUES ('672fb017044345de355c3fcd2d771477cbb69c2eb7cb5dbcd835a55b00d6f7f3acfa669f7e1543e7', 28, 1, 'MyApp', '[]', 0, '2019-01-09 08:32:08', '2019-01-09 08:32:08', '2020-01-09 08:32:08');
INSERT INTO `oauth_access_tokens` VALUES ('9bc0cf4f6863637f2a89131e160d6570df907a1dc779a5ccd58d48d960ecc34f84d74f9e3dabffa8', 29, 1, 'MyApp', '[]', 0, '2019-01-09 08:34:09', '2019-01-09 08:34:09', '2020-01-09 08:34:09');
INSERT INTO `oauth_access_tokens` VALUES ('8faacb5605cc86cdd75fc207e28fa9c0711909e64d51dc20c51dbe47e299953a853f28cb4cc43dd8', 30, 1, 'MyApp', '[]', 0, '2019-01-09 08:35:42', '2019-01-09 08:35:42', '2020-01-09 08:35:42');
INSERT INTO `oauth_access_tokens` VALUES ('58b2fe5b312f3cd988b718130b59a3c589154db15f24c2598799ffd211bb50e73f211423c7eaa452', 31, 1, 'MyApp', '[]', 0, '2019-01-09 08:37:06', '2019-01-09 08:37:06', '2020-01-09 08:37:06');
INSERT INTO `oauth_access_tokens` VALUES ('0222597c9661dae6a0c86bc0dd0134028e496e636264a899daa3a68f5da6d961109cdd1b9cd207d0', 32, 1, 'MyApp', '[]', 0, '2019-01-09 08:38:47', '2019-01-09 08:38:47', '2020-01-09 08:38:47');
INSERT INTO `oauth_access_tokens` VALUES ('76ba66a3e4d2d544c1af0c5e853e24309262d0b6a8499288e5bc2148f4a642f20ae445355f5b7cd5', 33, 1, 'MyApp', '[]', 0, '2019-01-09 08:39:41', '2019-01-09 08:39:41', '2020-01-09 08:39:41');
INSERT INTO `oauth_access_tokens` VALUES ('93062c07df7a0aeb992b89f1b70e3a8b4a6bcc4c7a5ac0d014193449b5f31d2895c8260194535592', 34, 1, 'MyApp', '[]', 0, '2019-01-09 08:41:22', '2019-01-09 08:41:22', '2020-01-09 08:41:22');
INSERT INTO `oauth_access_tokens` VALUES ('2d8c248f252264daf1cf73e54c28a4c152f9a8983f85ecde9a8918a65af4f292190a55825e4b5714', 35, 1, 'MyApp', '[]', 0, '2019-01-09 08:41:47', '2019-01-09 08:41:47', '2020-01-09 08:41:47');
INSERT INTO `oauth_access_tokens` VALUES ('ae94ec6953b2f471986f756e050db45e73622268214876289548bf7653ad02a4ba0ac026f595dcf7', 36, 1, 'MyApp', '[]', 0, '2019-01-09 08:42:56', '2019-01-09 08:42:56', '2020-01-09 08:42:56');
INSERT INTO `oauth_access_tokens` VALUES ('85cd3294278e0771f16d2f0f52662fc123d7224766d3d551c6ff592909efd38f8813ca384ae340b3', 37, 1, 'MyApp', '[]', 0, '2019-01-09 08:43:42', '2019-01-09 08:43:42', '2020-01-09 08:43:42');
INSERT INTO `oauth_access_tokens` VALUES ('bd737a1b658ecf59f15dd9ee55525352d2a8dbeef3d0983f5d14b9bb19f0e53c03a4a328c6b2620a', 38, 1, 'MyApp', '[]', 0, '2019-01-09 08:46:29', '2019-01-09 08:46:29', '2020-01-09 08:46:29');
INSERT INTO `oauth_access_tokens` VALUES ('c2d9db8befec0930d3b7875b327238401b8c9b3e787b417a2eb20cd33cffdd8aaf5681a88a12a51c', 38, 1, 'MyApp', '[]', 0, '2019-01-09 08:53:27', '2019-01-09 08:53:27', '2020-01-09 08:53:27');
INSERT INTO `oauth_access_tokens` VALUES ('d7ff2b9377d3239d3e892a016b40963faf38606c7e350e17665cf82c51024735a3c2a5561310269e', 38, 1, 'MyApp', '[]', 0, '2019-01-09 08:54:28', '2019-01-09 08:54:28', '2020-01-09 08:54:28');
INSERT INTO `oauth_access_tokens` VALUES ('06d481db63cbe8ababa2787e75dfad0df21292afc4c854d24ccd07e48c82b55a96f3a9a1c3fa3a4e', 38, 1, 'MyApp', '[]', 0, '2019-01-09 08:56:47', '2019-01-09 08:56:47', '2020-01-09 08:56:47');
INSERT INTO `oauth_access_tokens` VALUES ('13fb9612de5f608dd80e9429c1b921af2318b579fe43ea861fa87d3eb372c64e9a032860ebfffe3d', 38, 1, 'MyApp', '[]', 0, '2019-01-09 08:57:02', '2019-01-09 08:57:02', '2020-01-09 08:57:02');
INSERT INTO `oauth_access_tokens` VALUES ('f355ee85c6b72591dad7fb9e32bc42de33fd082060c90b32168446fa0ef81fb1d425c88c58651086', 39, 1, 'MyApp', '[]', 0, '2019-01-14 10:55:24', '2019-01-14 10:55:24', '2020-01-14 10:55:24');
INSERT INTO `oauth_access_tokens` VALUES ('997c779d42c5171cfd136e7b8dfbb8d002fe2aaa988e9675fc1325e4486978d8a29b2fd803c06bfa', 40, 1, 'MyApp', '[]', 0, '2019-01-14 10:56:49', '2019-01-14 10:56:49', '2020-01-14 10:56:49');
INSERT INTO `oauth_access_tokens` VALUES ('edc9a33729d48398c9fbffd1f2a7b65b2e8bc92dfb0a6d98f574227e59039f09d90caf90ce9bae42', 41, 1, 'MyApp', '[]', 0, '2019-01-14 11:09:21', '2019-01-14 11:09:21', '2020-01-14 11:09:21');
INSERT INTO `oauth_access_tokens` VALUES ('a851132676a6fdc081d1aad99311f8e89f06135e6dfb5cc4da59baf9c9f8e0880c9b0c630bbb04f3', 42, 1, 'MyApp', '[]', 0, '2019-01-14 11:37:23', '2019-01-14 11:37:23', '2020-01-14 11:37:23');
INSERT INTO `oauth_access_tokens` VALUES ('58db8b05ed48c8989e2348d448b52d948a4809a2552315e410ed322f72f442a66298469889eae67a', 43, 1, 'MyApp', '[]', 0, '2019-01-14 11:37:53', '2019-01-14 11:37:53', '2020-01-14 11:37:53');
INSERT INTO `oauth_access_tokens` VALUES ('54cf19010520888167af34155643b7cdddfafdfa92ad26c51423ea31d15cec72d7d8c9c9c500e247', 44, 1, 'MyApp', '[]', 0, '2019-01-14 11:42:59', '2019-01-14 11:42:59', '2020-01-14 11:42:59');
INSERT INTO `oauth_access_tokens` VALUES ('242f4cbe387229c47dc7a3f693a1f1951bcb794de07bf64a2b9ba9bcae628f9ba4326998dd756aa8', 45, 1, 'MyApp', '[]', 0, '2019-01-14 11:45:37', '2019-01-14 11:45:37', '2020-01-14 11:45:37');
INSERT INTO `oauth_access_tokens` VALUES ('aada4b0892d446bbfc12e69a7fbbc88bc7bb9473c40b363fced568817ddfab128850f317cb30323c', 46, 1, 'MyApp', '[]', 0, '2019-01-14 11:49:13', '2019-01-14 11:49:13', '2020-01-14 11:49:13');
INSERT INTO `oauth_access_tokens` VALUES ('4529eb8f9391aa78e2cedff2b2e8edc2f32e3c0b37a52fb1cb004e5aa6d39e50e75e42c1f5635c61', 47, 1, 'MyApp', '[]', 0, '2019-01-14 11:51:30', '2019-01-14 11:51:30', '2020-01-14 11:51:30');
INSERT INTO `oauth_access_tokens` VALUES ('304c26ba7c740546d95e8d1b3e185c5d290d55bc7dffe9ff1ad519b60cd0fe4df3ac3fe67c1ba49e', 48, 1, 'MyApp', '[]', 0, '2019-01-14 11:57:48', '2019-01-14 11:57:48', '2020-01-14 11:57:48');
INSERT INTO `oauth_access_tokens` VALUES ('9cd40e8b6c43b5c23df5f9e6a547e27197e0911315c7d41ec93e6c1ae00923b9c9f2712ce9bb5e91', 49, 1, 'MyApp', '[]', 0, '2019-01-14 11:58:33', '2019-01-14 11:58:33', '2020-01-14 11:58:33');
INSERT INTO `oauth_access_tokens` VALUES ('60e3c5b85625d512932eac190b3143f781f17eaf3d305ca0c1e97ff44f059badfcc3c308d20d88a6', 50, 1, 'MyApp', '[]', 0, '2019-01-14 12:04:21', '2019-01-14 12:04:21', '2020-01-14 12:04:21');
INSERT INTO `oauth_access_tokens` VALUES ('c0a2cea0ae6467c3d153a778dde0251807c79b4ec8da193e84d754d4ceaaa714e80979e7fe11af8d', 51, 1, 'MyApp', '[]', 0, '2019-01-14 12:05:56', '2019-01-14 12:05:56', '2020-01-14 12:05:56');
INSERT INTO `oauth_access_tokens` VALUES ('c5726eff0827a841435c9938237259621ba6ca4cc9f81158856ec072075c13c7f3cfa06b0170ea19', 52, 1, 'MyApp', '[]', 0, '2019-01-14 12:27:23', '2019-01-14 12:27:23', '2020-01-14 12:27:23');
INSERT INTO `oauth_access_tokens` VALUES ('f9621d182606211f18b9667cfce9002308bb039dbefe75c61a55592f1c4538231cc9e69e37e00408', 53, 1, 'MyApp', '[]', 0, '2019-01-14 12:27:58', '2019-01-14 12:27:58', '2020-01-14 12:27:58');
INSERT INTO `oauth_access_tokens` VALUES ('ed63336b56c5fef2b41a1b71dd3bf59e51c7525dcf8d962699fa84cd39751a05e51335b0f2e24df0', 54, 1, 'MyApp', '[]', 0, '2019-01-14 12:28:58', '2019-01-14 12:28:58', '2020-01-14 12:28:58');
INSERT INTO `oauth_access_tokens` VALUES ('0a5c25b82964a5cbc6bf4245c8f27e4e7dd3aea35e8b355a5dda6d2ecc58d92fcac13032915b8661', 55, 1, 'MyApp', '[]', 0, '2019-01-14 12:31:06', '2019-01-14 12:31:06', '2020-01-14 12:31:06');
INSERT INTO `oauth_access_tokens` VALUES ('15a993721184ea4dddff38d45b9fe3df47736fe68ae5a62fbecba8570698cf92db585722cc7bf23b', 56, 1, 'MyApp', '[]', 0, '2019-01-14 12:33:51', '2019-01-14 12:33:51', '2020-01-14 12:33:51');
INSERT INTO `oauth_access_tokens` VALUES ('dce37d4067761dbf5aaf53272e0ef6992945f036a766c33da3e94933a742f0752f5a8e1dea42f51c', 57, 1, 'MyApp', '[]', 0, '2019-01-14 12:37:06', '2019-01-14 12:37:06', '2020-01-14 12:37:06');
INSERT INTO `oauth_access_tokens` VALUES ('e7bd01e1862c09cb5cf38e1f9e4bc394abbd21e0b81f2e48bae60cc208313efbe1ac6bc8a35344ee', 58, 1, 'MyApp', '[]', 0, '2019-01-14 12:38:33', '2019-01-14 12:38:33', '2020-01-14 12:38:33');
INSERT INTO `oauth_access_tokens` VALUES ('3e7cd56c3f4642f58caf3a740d0511397b0d0bc9e71630d56cd6f18e0c91bbf6efd6b7e2965407b6', 59, 1, 'MyApp', '[]', 0, '2019-01-14 12:39:41', '2019-01-14 12:39:41', '2020-01-14 12:39:41');
INSERT INTO `oauth_access_tokens` VALUES ('96fc9267899271097b3b9cf3ec7e146033983f5b22567c8f0f054475d237b616f658da4419b9a7ec', 60, 1, 'MyApp', '[]', 0, '2019-01-14 13:02:52', '2019-01-14 13:02:52', '2020-01-14 13:02:52');
INSERT INTO `oauth_access_tokens` VALUES ('ec6a9aee33f5ee0ffbf04b9b7706323fbc52086cd5fb018911b08f034f11e8fa82354f6e4f2dcaf4', 61, 1, 'MyApp', '[]', 0, '2019-01-14 13:05:30', '2019-01-14 13:05:30', '2020-01-14 13:05:30');
INSERT INTO `oauth_access_tokens` VALUES ('0bd229058ba0a7587c83d41b1fe0089a2ef44bd163dcb1bd75d7b5c9637bb2bc410a44f69ae5f08a', 62, 1, 'MyApp', '[]', 0, '2019-01-14 13:06:21', '2019-01-14 13:06:21', '2020-01-14 13:06:21');
INSERT INTO `oauth_access_tokens` VALUES ('de87ffa2bf581bc0b164b29eca18027bc452563f53827477c8f3dfe343882523114d8bce9354b389', 63, 1, 'MyApp', '[]', 0, '2019-01-14 13:06:49', '2019-01-14 13:06:49', '2020-01-14 13:06:49');
INSERT INTO `oauth_access_tokens` VALUES ('0f3161f57b9f77290beb2a966490ca57d403a1279ea6725ca5699ecbb5aa9032f6036075810d05b6', 64, 1, 'MyApp', '[]', 0, '2019-01-14 13:07:40', '2019-01-14 13:07:40', '2020-01-14 13:07:40');
INSERT INTO `oauth_access_tokens` VALUES ('4f78b5a382c4f6f1427394d24d44477d41497aa07789fe89e083e2a4e49a3112b360315df08c5eb1', 65, 1, 'MyApp', '[]', 0, '2019-01-14 13:09:48', '2019-01-14 13:09:48', '2020-01-14 13:09:48');
INSERT INTO `oauth_access_tokens` VALUES ('b50e457dd25c2edd7eceedf030c7ed4370878babf8b8f710a6d29a8ec8a36e35457e5b058f28aa32', 66, 1, 'MyApp', '[]', 0, '2019-01-14 13:15:58', '2019-01-14 13:15:58', '2020-01-14 13:15:58');
INSERT INTO `oauth_access_tokens` VALUES ('2e4ef3cb6867fe58d009679e28998f392542232a149503b53aca004669982676afdd90797be37ee8', 67, 1, 'MyApp', '[]', 0, '2019-01-14 13:19:19', '2019-01-14 13:19:19', '2020-01-14 13:19:19');
INSERT INTO `oauth_access_tokens` VALUES ('620fd05aaab061780c17c491111e399946c334996a553e99f3242b1ce02a952e2210be727fca3ccd', 68, 1, 'MyApp', '[]', 0, '2019-01-14 13:48:30', '2019-01-14 13:48:30', '2020-01-14 13:48:30');
INSERT INTO `oauth_access_tokens` VALUES ('aba24cc296c426ace4d1c50001d3d3c5601a45175302cb0f9dfab167d53d29a5d14b387d0c95cc74', 69, 1, 'MyApp', '[]', 0, '2019-01-14 13:52:43', '2019-01-14 13:52:43', '2020-01-14 13:52:43');
INSERT INTO `oauth_access_tokens` VALUES ('8d3b157824d5d054b7f2ebb64edb53681254a5c96689ab46d0289364a458b6ec4eb84de0fbdead70', 70, 1, 'MyApp', '[]', 0, '2019-01-14 15:31:41', '2019-01-14 15:31:41', '2020-01-14 15:31:41');
INSERT INTO `oauth_access_tokens` VALUES ('6c19f02dbac4e86eee8a536b5d1fadddceebb218ab7d97c7da7be80d7a7b71a12b02215b24ec0d57', 71, 1, 'MyApp', '[]', 0, '2019-01-14 15:35:09', '2019-01-14 15:35:09', '2020-01-14 15:35:09');
INSERT INTO `oauth_access_tokens` VALUES ('139956db91bd084d5d1310f0df7ff095954353edfcf5869099b619e91669a45da5efba522d9366e7', 72, 1, 'MyApp', '[]', 0, '2019-01-14 15:36:29', '2019-01-14 15:36:29', '2020-01-14 15:36:29');
INSERT INTO `oauth_access_tokens` VALUES ('6488909abd7e247861bdcfb9d89242c067348eb7cb263b94f2cd32d6426f2803f207a321797cab4d', 73, 1, 'MyApp', '[]', 0, '2019-01-14 23:43:26', '2019-01-14 23:43:26', '2020-01-14 23:43:26');
INSERT INTO `oauth_access_tokens` VALUES ('86f3dc0d320263e39152bd9544c84dc652c99697ebd126ceffc75a9185e593a6821e0c2e66a7a779', 74, 1, 'MyApp', '[]', 0, '2019-01-14 23:46:40', '2019-01-14 23:46:40', '2020-01-14 23:46:40');
INSERT INTO `oauth_access_tokens` VALUES ('5fe10f5ef4b0a1f0d58855eb3a3181fb8f2affe16068d84e1e518105e2b6a093c46debbf698460d5', 75, 1, 'MyApp', '[]', 0, '2019-01-14 23:47:20', '2019-01-14 23:47:20', '2020-01-14 23:47:20');
INSERT INTO `oauth_access_tokens` VALUES ('16ef00085d99ac11416142b293dca4742904f067e5220247ffab8f8c0e7363eb50cf91c6d4e5097b', 76, 1, 'MyApp', '[]', 0, '2019-01-15 00:17:10', '2019-01-15 00:17:10', '2020-01-15 00:17:10');
INSERT INTO `oauth_access_tokens` VALUES ('d2bdee4a5fca5d55a4ea11afed7a338aacc6a229d110ebb332d956a5cb08395cb454ae50b75f04f9', 77, 1, 'MyApp', '[]', 0, '2019-01-15 00:20:22', '2019-01-15 00:20:22', '2020-01-15 00:20:22');
INSERT INTO `oauth_access_tokens` VALUES ('f2d58a9b64bda0446abdd83f12fa0aa268eccf248defd74ba51cdfd37197b92276864329736ddeb4', 78, 1, 'MyApp', '[]', 0, '2019-01-15 00:22:03', '2019-01-15 00:22:03', '2020-01-15 00:22:03');
INSERT INTO `oauth_access_tokens` VALUES ('a073c0753d50ef9c9232baa4bb5c871c9b0c2e3b594d2563602dd04edf2922e252ea4a80b4b18c14', 79, 1, 'MyApp', '[]', 0, '2019-01-15 00:30:27', '2019-01-15 00:30:27', '2020-01-15 00:30:27');
INSERT INTO `oauth_access_tokens` VALUES ('68bb6c02968895322fe567ad3f39ebc23c30a44b6e11cc9d76f45c41f1d6fdd4cf0e0cfcbe9ae982', 80, 1, 'MyApp', '[]', 0, '2019-01-15 00:31:57', '2019-01-15 00:31:57', '2020-01-15 00:31:57');
INSERT INTO `oauth_access_tokens` VALUES ('8e666f0feb09b64171dd74c1d1bff292bef12bc6cb797beb3dde049a25992bb6829a27b854cb5687', 81, 1, 'MyApp', '[]', 0, '2019-01-15 00:32:55', '2019-01-15 00:32:55', '2020-01-15 00:32:55');
INSERT INTO `oauth_access_tokens` VALUES ('f296d7e79dea304f9936227675ef27e1fb74bb786807fab60fc0fed8a347e48dd1cd87156ad2db9e', 82, 1, 'MyApp', '[]', 0, '2019-01-15 00:34:29', '2019-01-15 00:34:29', '2020-01-15 00:34:29');
INSERT INTO `oauth_access_tokens` VALUES ('57eaa49a5a2320ff5757a3faf23e1400674f7997337d1ab77e0ac83c9a9c61f195ecc9a281bf33b0', 83, 1, 'MyApp', '[]', 0, '2019-01-15 00:51:31', '2019-01-15 00:51:31', '2020-01-15 00:51:31');
INSERT INTO `oauth_access_tokens` VALUES ('2544976145ec056924c5ceb734bb8120cab2dd69117820d3c9e574cf8ec002dec7ae243d08e2c8e7', 84, 1, 'MyApp', '[]', 0, '2019-01-15 08:29:38', '2019-01-15 08:29:38', '2020-01-15 08:29:38');
INSERT INTO `oauth_access_tokens` VALUES ('541aa4bdd032b642117f6a1aa4fec2c38f6458219d54bb7904bbbf5b174749ccf420b37b2e3ff140', 84, 1, 'MyApp', '[]', 0, '2019-01-15 10:17:06', '2019-01-15 10:17:06', '2020-01-15 10:17:06');
INSERT INTO `oauth_access_tokens` VALUES ('71bd92e9f70ed10d9612228c2cbe4cfd568579ca35a23d006507b8c3842d05101c76140ef1bfca5c', 84, 1, 'MyApp', '[]', 0, '2019-01-15 10:17:49', '2019-01-15 10:17:49', '2020-01-15 10:17:49');
INSERT INTO `oauth_access_tokens` VALUES ('5ddc10952d535550b564252406758d02d0bce03a59aca7e868fd4ae22e2bf5445723c2fb1baa635c', 84, 1, 'MyApp', '[]', 0, '2019-01-15 10:18:31', '2019-01-15 10:18:31', '2020-01-15 10:18:31');
INSERT INTO `oauth_access_tokens` VALUES ('1e4a2da28f8d6584cc47c856e466d72dc086a0d00348bbbac854e135eb914efd836b321db75cb44f', 84, 1, 'MyApp', '[]', 0, '2019-01-15 11:06:53', '2019-01-15 11:06:53', '2020-01-15 11:06:53');
INSERT INTO `oauth_access_tokens` VALUES ('4aafea2d1d2ce8700a469104759e55a2eb657f4b4a0364555c03e4e25431ed54da82b9b7a0d9222e', 84, 1, 'MyApp', '[]', 0, '2019-01-15 11:27:45', '2019-01-15 11:27:45', '2020-01-15 11:27:45');
INSERT INTO `oauth_access_tokens` VALUES ('0fefdaef0f20ff8ceef4c281091f0fed743911e409f13a4d8f7a65209fb7711d85d44e10005c0e7b', 84, 1, 'MyApp', '[]', 0, '2019-01-15 11:28:29', '2019-01-15 11:28:29', '2020-01-15 11:28:29');
INSERT INTO `oauth_access_tokens` VALUES ('67de4c48ba1be019f524e5a4503e53957dbb87ab2bd59ee3e48830bf7fecd89d56e468005f61a18f', 84, 1, 'MyApp', '[]', 0, '2019-01-15 11:53:27', '2019-01-15 11:53:27', '2020-01-15 11:53:27');
INSERT INTO `oauth_access_tokens` VALUES ('e9f923bd6265213c25b3c92caafcc2b776746607f6dbdb2722b75fce7762d0ce25913d57602d76cd', 85, 1, 'MyApp', '[]', 0, '2019-01-15 11:54:09', '2019-01-15 11:54:09', '2020-01-15 11:54:09');
INSERT INTO `oauth_access_tokens` VALUES ('5cc5c0e9551ce544854f467bc3af2d9f4018750a1016299aa9fb44666ba45e258293a5f5a0f3fc80', 85, 1, 'MyApp', '[]', 0, '2019-01-15 11:54:52', '2019-01-15 11:54:52', '2020-01-15 11:54:52');
INSERT INTO `oauth_access_tokens` VALUES ('7a55538706b59349e5865b0a3b62a226b1f4504a45151e0cc1198619fb20127a63eeafd68d8537de', 85, 1, 'MyApp', '[]', 0, '2019-01-15 11:55:55', '2019-01-15 11:55:55', '2020-01-15 11:55:55');
INSERT INTO `oauth_access_tokens` VALUES ('b12bab7d1b93b4334e207df1aa7d3ded5c8aba644a353702eaf1ed7a0fe42ab07c366464af9e9803', 86, 1, 'MyApp', '[]', 0, '2019-01-15 11:56:30', '2019-01-15 11:56:30', '2020-01-15 11:56:30');
INSERT INTO `oauth_access_tokens` VALUES ('c813e8c59f61250207df793fabc3c685d9325e9eff32c7e9e3feb3977f77cac9a70dfdd4a3b8513b', 87, 1, 'MyApp', '[]', 0, '2019-01-15 11:57:40', '2019-01-15 11:57:40', '2020-01-15 11:57:40');
INSERT INTO `oauth_access_tokens` VALUES ('5dc1bc305ccce35d22d80fd19a662d4de79dac6c4d5e7e73703693f786d7e472917d8a417f736095', 87, 1, 'MyApp', '[]', 0, '2019-01-15 12:04:17', '2019-01-15 12:04:17', '2020-01-15 12:04:17');
INSERT INTO `oauth_access_tokens` VALUES ('30b7cb744fa3741e84e765c5ad613ffae40c78a15d3d03cc91c142f93ef1e6eaf4fb9c455b25b147', 87, 1, 'MyApp', '[]', 0, '2019-01-15 13:51:46', '2019-01-15 13:51:46', '2020-01-15 13:51:46');
INSERT INTO `oauth_access_tokens` VALUES ('1a5127d4924ae4525e3538950e478fc129d32b7a31c7a9fdfa589bc8e585d168602fc5e60204ebc1', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:13:49', '2019-01-15 15:13:49', '2020-01-15 15:13:49');
INSERT INTO `oauth_access_tokens` VALUES ('23d52cffda59f2e51e530a787e10a9766e526b16f57faf29baf09a3bbe89665829c80709688619cf', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:14:12', '2019-01-15 15:14:12', '2020-01-15 15:14:12');
INSERT INTO `oauth_access_tokens` VALUES ('ef0619e8375c78ac0f66553833403112de70d29d6e7f1a37a6fc474a37824d1d9819759b54243af9', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:15:23', '2019-01-15 15:15:23', '2020-01-15 15:15:23');
INSERT INTO `oauth_access_tokens` VALUES ('cfacb3e38de280a9c661d055d6b6121df02f8abef747e5d8cd260c3864c78e7707ecdddf34af45b8', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:17:18', '2019-01-15 15:17:18', '2020-01-15 15:17:18');
INSERT INTO `oauth_access_tokens` VALUES ('9e5e8150c8ee764e8b92bbf006d3f606469116cc8316d99935a9154af4c0df01f7086769755a71a9', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:24:07', '2019-01-15 15:24:07', '2020-01-15 15:24:07');
INSERT INTO `oauth_access_tokens` VALUES ('f2a2df8f48ca8a8afaa2513d910d0ef812173eab046a13f9962f60e988662815c7f58219417faa82', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:24:18', '2019-01-15 15:24:18', '2020-01-15 15:24:18');
INSERT INTO `oauth_access_tokens` VALUES ('eefd429030824a463148d49aff2776b57d174f52aca222258d5356dea56ccf203a3675f83837c864', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:24:36', '2019-01-15 15:24:36', '2020-01-15 15:24:36');
INSERT INTO `oauth_access_tokens` VALUES ('35fd6d40bb74f248df746afd5c0547098b2d589814b473942e06a62813be9b1b84f193c897e0d84a', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:24:41', '2019-01-15 15:24:41', '2020-01-15 15:24:41');
INSERT INTO `oauth_access_tokens` VALUES ('e6a13944a69468c72457450eff4c7f48cb00ae4ce62dc0da566bcc235be4f151d9ed560a2673734a', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:24:44', '2019-01-15 15:24:44', '2020-01-15 15:24:44');
INSERT INTO `oauth_access_tokens` VALUES ('6ffe352563205acc2a958349156083f5906db3f4eb48824ea6e4e02ee901bcadbd957927929f7090', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:25:27', '2019-01-15 15:25:27', '2020-01-15 15:25:27');
INSERT INTO `oauth_access_tokens` VALUES ('2e052cddcd6ece56ca4f1b73a4835b5e79c0d2b8747c39306e99e749723ac153b42d879ed32ff512', 87, 1, 'MyApp', '[]', 0, '2019-01-15 15:32:48', '2019-01-15 15:32:48', '2020-01-15 15:32:48');
INSERT INTO `oauth_access_tokens` VALUES ('3ad344f5e531eb2fdc47e5bf2bcfdee2ee4ab1bf3da2474c5e03ab6266ee0de14ee2c820f76e62fa', 88, 1, 'MyApp', '[]', 0, '2019-01-15 15:33:19', '2019-01-15 15:33:19', '2020-01-15 15:33:19');
INSERT INTO `oauth_access_tokens` VALUES ('356937bff1534778d3f59d265c8a8b4fca5852449e8958331f16cafd570bb6921bf7ab364b2036a2', 89, 1, 'MyApp', '[]', 0, '2019-01-15 15:36:14', '2019-01-15 15:36:14', '2020-01-15 15:36:14');
INSERT INTO `oauth_access_tokens` VALUES ('e16c63b4303055faed9a350ce94e0997c2c419b700bb9baca5235830d343d08e6dc6069760245e51', 89, 1, 'MyApp', '[]', 0, '2019-01-15 15:37:12', '2019-01-15 15:37:12', '2020-01-15 15:37:12');
INSERT INTO `oauth_access_tokens` VALUES ('a16d34c919bdb355ef81bf1bd9e05cad77bcdba1aba1a3e00ef76f41108f7045002f9681f039cd94', 89, 1, 'MyApp', '[]', 0, '2019-01-15 15:48:05', '2019-01-15 15:48:05', '2020-01-15 15:48:05');
INSERT INTO `oauth_access_tokens` VALUES ('8947009285698461662c2faffb558f2d1ee51dc376d59533d353669911bc4e1c1966cb924f7443cf', 89, 1, 'MyApp', '[]', 0, '2019-01-15 15:48:13', '2019-01-15 15:48:13', '2020-01-15 15:48:13');
INSERT INTO `oauth_access_tokens` VALUES ('c06bf0e7dc2faab339c68853b9d57d72708fa584e8877e7ff0ec9c92e22ae5415dd0379cb3fa1c83', 91, 1, 'MyApp', '[]', 0, '2019-01-15 15:49:00', '2019-01-15 15:49:00', '2020-01-15 15:49:00');
INSERT INTO `oauth_access_tokens` VALUES ('661965bd87a5121d2d9914b7f4d6888d0c35ede71006631e06c023db5a186f205d7df123e2a41612', 91, 1, 'MyApp', '[]', 0, '2019-01-15 15:49:37', '2019-01-15 15:49:37', '2020-01-15 15:49:37');
INSERT INTO `oauth_access_tokens` VALUES ('33d895dc35c237305be27e40b9ebab6adf9b3de05362585b5e54180e15caef2d1255bc3ac19080b6', 91, 1, 'MyApp', '[]', 0, '2019-01-15 15:59:06', '2019-01-15 15:59:06', '2020-01-15 15:59:06');
INSERT INTO `oauth_access_tokens` VALUES ('20e33b04454da9af8322b038cdb9bc0688f12350c1b3bf1962e185a9723a3ad35bfa284139fa6891', 91, 1, 'MyApp', '[]', 0, '2019-01-15 15:59:17', '2019-01-15 15:59:17', '2020-01-15 15:59:17');
INSERT INTO `oauth_access_tokens` VALUES ('42e985b725eef6dfa23e664a29deeb4a0d3719e28271c1ac8d1d161394d7612def4a67229146a3d4', 91, 1, 'MyApp', '[]', 0, '2019-01-15 16:00:27', '2019-01-15 16:00:27', '2020-01-15 16:00:27');
INSERT INTO `oauth_access_tokens` VALUES ('292207da3638b4cdb8e027095522a4a935c1b47e4f3ff0ba26c183f4af8c177a39687cb098385544', 91, 1, 'MyApp', '[]', 0, '2019-01-15 16:01:48', '2019-01-15 16:01:48', '2020-01-15 16:01:48');
INSERT INTO `oauth_access_tokens` VALUES ('fb41a5c6184037c6f99c8ce738b0a91c333034e23f21637471f366146eeaf52adc7fb27c20297dc7', 91, 1, 'MyApp', '[]', 0, '2019-01-15 16:03:18', '2019-01-15 16:03:18', '2020-01-15 16:03:18');
INSERT INTO `oauth_access_tokens` VALUES ('2fd834f401d462a8086aca5870354d693154f464b2af79634168dd132f3a49369ad1d909d12278e4', 91, 1, 'MyApp', '[]', 0, '2019-01-15 16:03:41', '2019-01-15 16:03:41', '2020-01-15 16:03:41');
INSERT INTO `oauth_access_tokens` VALUES ('6e127939e84cc5b15a3345daac3e92ac4813ff4bd1c5c96e9019afe87d7d675b4586dd4528632fd2', 91, 1, 'MyApp', '[]', 0, '2019-01-15 16:10:38', '2019-01-15 16:10:38', '2020-01-15 16:10:38');
INSERT INTO `oauth_access_tokens` VALUES ('cb18ada505a77da8b6a91fc89840d57cc04df774d5dba94e12986ecfdeff6569dfdd853f2af5c61d', 91, 1, 'MyApp', '[]', 0, '2019-01-16 09:35:15', '2019-01-16 09:35:15', '2020-01-16 09:35:15');
INSERT INTO `oauth_access_tokens` VALUES ('d6e7f29cb7e588e1c844788f4e08dee64a354889b05120da92cdf227be2e60497403a75671825ac8', 91, 1, 'MyApp', '[]', 0, '2019-01-16 09:38:03', '2019-01-16 09:38:03', '2020-01-16 09:38:03');
INSERT INTO `oauth_access_tokens` VALUES ('1cf6ba620234cb595214e04838360fa6a8e1c17933b2e85fb41a780deda68221fd818353182e06b0', 92, 1, 'MyApp', '[]', 0, '2019-01-16 10:04:40', '2019-01-16 10:04:40', '2020-01-16 10:04:40');
INSERT INTO `oauth_access_tokens` VALUES ('57a7c27b09df1f46566eb1deb3fdefbab3cc9d2ece5f1aed34c92b15e4800c7b75b0dde00dcf80f8', 91, 1, 'MyApp', '[]', 0, '2019-01-16 10:17:05', '2019-01-16 10:17:05', '2020-01-16 10:17:05');
INSERT INTO `oauth_access_tokens` VALUES ('83d2c740e5a94330f0383eda980ccfbb97d90a02ad481368f89716b319013e748e5a157413b7c1e7', 91, 1, 'MyApp', '[]', 0, '2019-01-16 10:17:57', '2019-01-16 10:17:57', '2020-01-16 10:17:57');
INSERT INTO `oauth_access_tokens` VALUES ('66553790b41d0b31d884cd06e4b10a8324dea853d3b647b57b1c2f2def6104aa54f471ea3cc4b4cb', 91, 1, 'MyApp', '[]', 0, '2019-01-16 10:20:11', '2019-01-16 10:20:11', '2020-01-16 10:20:11');
INSERT INTO `oauth_access_tokens` VALUES ('bff1fd5038c1af1239c220624a51767dbacf5935a50499bab15c553503b38c7a35a8f59c454c6ae2', 93, 1, 'MyApp', '[]', 0, '2019-01-16 10:49:30', '2019-01-16 10:49:30', '2020-01-16 10:49:30');
INSERT INTO `oauth_access_tokens` VALUES ('3cac2e12284f61e9e9b2468a3347dcfba9ce019f625b752d0db9297b37f60a882be59c42a6f16c3d', 94, 1, 'MyApp', '[]', 0, '2019-01-16 10:50:46', '2019-01-16 10:50:46', '2020-01-16 10:50:46');
INSERT INTO `oauth_access_tokens` VALUES ('a4d481cdf75626c03acc92da7617094410a5fad884d0be88fa82400ee4acfa549c428ffbb1c321c2', 95, 1, 'MyApp', '[]', 0, '2019-01-16 10:51:01', '2019-01-16 10:51:01', '2020-01-16 10:51:01');
INSERT INTO `oauth_access_tokens` VALUES ('a522595463d26cf0f08cd5cbcb1d2d4fb3ae2c017007aa8678428ed1cfe7abaa207cff35c414827f', 96, 1, 'MyApp', '[]', 0, '2019-01-16 10:51:36', '2019-01-16 10:51:36', '2020-01-16 10:51:36');
INSERT INTO `oauth_access_tokens` VALUES ('1939e0ee21ab6d746e55ec82f2d9f3d4b5bdbd72ee5f1d3023eab90f5803e7836da01ef9c6a5396e', 97, 1, 'MyApp', '[]', 0, '2019-01-16 10:52:22', '2019-01-16 10:52:22', '2020-01-16 10:52:22');
INSERT INTO `oauth_access_tokens` VALUES ('035e2a6332f89ee7c684d2730abfc4a876b4e9465ed3cdf44cc17ab2fe911f10dd926282b0b252f5', 98, 1, 'MyApp', '[]', 0, '2019-01-16 10:55:58', '2019-01-16 10:55:58', '2020-01-16 10:55:58');
INSERT INTO `oauth_access_tokens` VALUES ('9579fa511ec9b317c8622da6acf43980369a7f5db6d099881c12d9a9e524612ebe975cf5c1623b97', 99, 1, 'MyApp', '[]', 0, '2019-01-16 10:57:04', '2019-01-16 10:57:04', '2020-01-16 10:57:04');
INSERT INTO `oauth_access_tokens` VALUES ('6db1a2eb15dbe40eab421555f7ff5decacfbadbb24a8393729f6cdc80f9b523b94de1f67da19070c', 100, 1, 'MyApp', '[]', 0, '2019-01-16 10:58:23', '2019-01-16 10:58:23', '2020-01-16 10:58:23');
INSERT INTO `oauth_access_tokens` VALUES ('48e06373a3ffdc70a02c69c289b08bdc90a2869b8c41825b3d921efebbe5e7f33f93f3900acdb120', 101, 1, 'MyApp', '[]', 0, '2019-01-16 10:59:28', '2019-01-16 10:59:28', '2020-01-16 10:59:28');
INSERT INTO `oauth_access_tokens` VALUES ('0db2b5197f1b09d4dad9644c53e04fca83b334117fb4f532bb24d509b9a3fa00dda774698a2d7b62', 102, 1, 'MyApp', '[]', 0, '2019-01-16 11:01:39', '2019-01-16 11:01:39', '2020-01-16 11:01:39');
INSERT INTO `oauth_access_tokens` VALUES ('2d8c5819e9789a0f17a850bdfb5a33c48a366a90a51e5c53f2a46445362eeea3b591f1966132ec14', 103, 1, 'MyApp', '[]', 0, '2019-01-16 11:04:31', '2019-01-16 11:04:31', '2020-01-16 11:04:31');
INSERT INTO `oauth_access_tokens` VALUES ('55ab901e1383f46a268f30056f42eca29811b6500a88ea74df0a3174e1470b5e1facfdc7818fffb4', 104, 1, 'MyApp', '[]', 0, '2019-01-16 11:05:26', '2019-01-16 11:05:26', '2020-01-16 11:05:26');
INSERT INTO `oauth_access_tokens` VALUES ('3695c5447517a16265d2ba19cad1a79d412d98bad0ffab14e2a0df38b7398dbe0e3a3ad54f9576cf', 105, 1, 'MyApp', '[]', 0, '2019-01-16 11:11:43', '2019-01-16 11:11:43', '2020-01-16 11:11:43');
INSERT INTO `oauth_access_tokens` VALUES ('94b213c16886a08a6101eb7194fd3b91d5a4c28578afde553468aa8fd9bc9e666ac8d5859b80420a', 106, 1, 'MyApp', '[]', 0, '2019-01-16 11:13:02', '2019-01-16 11:13:02', '2020-01-16 11:13:02');
INSERT INTO `oauth_access_tokens` VALUES ('cf69e32c2ec10dd9da6c5e489a42758104d2aea568461bb1868fffdcde7be27994d71c60c2e91f26', 107, 1, 'MyApp', '[]', 0, '2019-01-16 11:14:07', '2019-01-16 11:14:07', '2020-01-16 11:14:07');
INSERT INTO `oauth_access_tokens` VALUES ('6ffbc2dc995c0dec646217d5e692d8e0eaf327f4ec763e694eb7ca65c4277ac99b0a2b730c5efd6a', 108, 1, 'MyApp', '[]', 0, '2019-01-16 11:19:56', '2019-01-16 11:19:56', '2020-01-16 11:19:56');
INSERT INTO `oauth_access_tokens` VALUES ('e0ebf686ead2025a5d455676d4f50b0bd061ed3aa0b9221e68dc4e804d62605295c2129e374e52bb', 108, 1, 'MyApp', '[]', 0, '2019-01-16 11:24:33', '2019-01-16 11:24:33', '2020-01-16 11:24:33');
INSERT INTO `oauth_access_tokens` VALUES ('d873143e42ae268d4839a1b0321f7d0aba2acf1ed4733350c58efec18c2313eec1d826a57fbe6602', 109, 1, 'MyApp', '[]', 0, '2019-01-16 11:37:01', '2019-01-16 11:37:01', '2020-01-16 11:37:01');
INSERT INTO `oauth_access_tokens` VALUES ('3d7377d6d1170a3d0a6b9cf5dd95b2d3fb903d7c95f82f79d44982e1be38a73c21ba3c4fbcb57e2c', 109, 1, 'MyApp', '[]', 0, '2019-01-16 11:37:42', '2019-01-16 11:37:42', '2020-01-16 11:37:42');
INSERT INTO `oauth_access_tokens` VALUES ('26ccd4a8ad73e43c8fcfb5df4a7ee66df9c8eb30e4f8a51d47b365d9f0e457fda9905ed585234f9f', 110, 1, 'MyApp', '[]', 0, '2019-01-16 12:00:30', '2019-01-16 12:00:30', '2020-01-16 12:00:30');
INSERT INTO `oauth_access_tokens` VALUES ('a58bc7e73ea9b00dd761bad9c33e3011186a865a99eb1c0f69314598523aa10806f8661906573fcd', 111, 1, 'MyApp', '[]', 0, '2019-01-16 12:04:01', '2019-01-16 12:04:01', '2020-01-16 12:04:01');
INSERT INTO `oauth_access_tokens` VALUES ('b2f31185eab0293ef3407026e477a8e3e0df53c25dbb15408ce4730cd90438d179ff916582979107', 112, 1, 'MyApp', '[]', 0, '2019-01-16 12:05:33', '2019-01-16 12:05:33', '2020-01-16 12:05:33');
INSERT INTO `oauth_access_tokens` VALUES ('d3ec1ac6cb863864176ce8df559dd1ffc8f8aca80af29d9be12fb5f766c0855d3c421ae3d0a88c41', 114, 1, 'MyApp', '[]', 0, '2019-01-16 12:09:15', '2019-01-16 12:09:15', '2020-01-16 12:09:15');
INSERT INTO `oauth_access_tokens` VALUES ('52d7d24ccfa0afaf874e2a3cd2edfe16747b6e795255632601b2a6a4a41cfacd37755ed1896e8f26', 114, 1, 'MyApp', '[]', 0, '2019-01-16 12:16:45', '2019-01-16 12:16:45', '2020-01-16 12:16:45');
INSERT INTO `oauth_access_tokens` VALUES ('7a4c1234f13cc89b88bb076a5624a0368e65b9c9c8a7e0e8eea0a8d05289108d55c6120af06f1615', 115, 1, 'MyApp', '[]', 0, '2019-01-16 12:17:21', '2019-01-16 12:17:21', '2020-01-16 12:17:21');
INSERT INTO `oauth_access_tokens` VALUES ('e80087c49d54d5187ebee13360e8e639d888ca45eeb5d778e18da17605cc567430aa775cbff5b265', 115, 1, 'MyApp', '[]', 0, '2019-01-16 12:54:54', '2019-01-16 12:54:54', '2020-01-16 12:54:54');
INSERT INTO `oauth_access_tokens` VALUES ('0a1a1c61d03c05fb2af1671ad7feeeb55a8e0d0982b51de4013498be649f3140e9b677e55176cf41', 116, 1, 'MyApp', '[]', 0, '2019-01-16 13:03:27', '2019-01-16 13:03:27', '2020-01-16 13:03:27');
INSERT INTO `oauth_access_tokens` VALUES ('3e2d280ede6334686cdb11ed725b227e7c9a29dc3a04531dc99f8982112ac081e883285fafb9ee61', 117, 1, 'MyApp', '[]', 0, '2019-01-16 13:10:09', '2019-01-16 13:10:09', '2020-01-16 13:10:09');
INSERT INTO `oauth_access_tokens` VALUES ('8e39ec5b5dadc45cf7446fe0e4037c4041008c8524403dc7130ff7a6a99e798fe50b29e9dafb0c4b', 118, 1, 'MyApp', '[]', 0, '2019-01-16 13:16:29', '2019-01-16 13:16:29', '2020-01-16 13:16:29');
INSERT INTO `oauth_access_tokens` VALUES ('6725d942cad067cda188acaee146be12693bb42a90cfd196bc554f90d9bba25919f77aae96c38b93', 118, 1, 'MyApp', '[]', 0, '2019-01-16 15:20:20', '2019-01-16 15:20:20', '2020-01-16 15:20:20');
INSERT INTO `oauth_access_tokens` VALUES ('51899c23c40b03d813226d1a4474ae77cedaad27ab9179ae0c9d0c2d8569117c6397fa361ded457b', 119, 1, 'MyApp', '[]', 0, '2019-01-16 15:22:54', '2019-01-16 15:22:54', '2020-01-16 15:22:54');
INSERT INTO `oauth_access_tokens` VALUES ('1b2bc3f0c1117b70fb5f8355a57ec462af4190d8b44bdeacbfd544a47721a2065da911711c8a8ba6', 119, 1, 'MyApp', '[]', 0, '2019-01-16 15:24:41', '2019-01-16 15:24:41', '2020-01-16 15:24:41');
INSERT INTO `oauth_access_tokens` VALUES ('eb81c397f22651ca8bf027a20c37bb22d4be09ce02fcba402e621552e67a1d61b64e462078b09509', 120, 1, 'MyApp', '[]', 0, '2019-01-16 15:54:14', '2019-01-16 15:54:14', '2020-01-16 15:54:14');
INSERT INTO `oauth_access_tokens` VALUES ('353e5bc01b110b8c093c37d7732b2695783020c44de9a3c23b3ea46b77e224f89b70710fad08728e', 121, 1, 'MyApp', '[]', 0, '2019-01-16 17:17:32', '2019-01-16 17:17:32', '2020-01-16 17:17:32');
INSERT INTO `oauth_access_tokens` VALUES ('b6e9b8006cb6ef0be95f3f4cfea7cb8871448b17a8cdda1567721251b58374168ea52f348bdc3040', 122, 1, 'MyApp', '[]', 0, '2019-01-16 17:24:57', '2019-01-16 17:24:57', '2020-01-16 17:24:57');
INSERT INTO `oauth_access_tokens` VALUES ('c01611a64855f45037bca7019907c9bf1b5e70906c3b17b65d195c16ccab14a8efa13269edec9245', 123, 1, 'MyApp', '[]', 0, '2019-01-16 17:26:53', '2019-01-16 17:26:53', '2020-01-16 17:26:53');
INSERT INTO `oauth_access_tokens` VALUES ('6778f1d5da356353bf2e376bfaf6ae3de56d94f3d0c50d37a99318f43de05c1b70fcd368f1ba0a73', 122, 1, 'MyApp', '[]', 0, '2019-01-16 17:32:06', '2019-01-16 17:32:06', '2020-01-16 17:32:06');
INSERT INTO `oauth_access_tokens` VALUES ('30bb92ab0b3c7e103861037c526abfdd779c3bb317ca60515a739046e09cbd6b591bb21f8e80131a', 124, 1, 'MyApp', '[]', 0, '2019-01-16 17:33:27', '2019-01-16 17:33:27', '2020-01-16 17:33:27');
INSERT INTO `oauth_access_tokens` VALUES ('6254071fd73c769330bc9f893e550e998ab156ce11b34eacf0d49589ba510289106898782f698cdf', 125, 1, 'MyApp', '[]', 0, '2019-01-16 17:37:05', '2019-01-16 17:37:05', '2020-01-16 17:37:05');
INSERT INTO `oauth_access_tokens` VALUES ('28182c434d5bb8684a00488da017d07a5c0233f7a1504efa3852ef542ec6dc21ae2d22880002225b', 122, 1, 'MyApp', '[]', 0, '2019-01-16 17:38:37', '2019-01-16 17:38:37', '2020-01-16 17:38:37');
INSERT INTO `oauth_access_tokens` VALUES ('ab3c97060b18a269fc7839df035087b4af69df78f140110d14a3ecb92bcb284d434356ed5ade2a29', 126, 1, 'MyApp', '[]', 0, '2019-01-16 17:40:48', '2019-01-16 17:40:48', '2020-01-16 17:40:48');
INSERT INTO `oauth_access_tokens` VALUES ('7ccc2e8021a19d5fc3210524e223d7f1778577af7371af2f94d1965fb59d742806e950dfe3fefd13', 127, 1, 'MyApp', '[]', 0, '2019-01-16 17:42:13', '2019-01-16 17:42:13', '2020-01-16 17:42:13');
INSERT INTO `oauth_access_tokens` VALUES ('9acc5a41ae53149f6f1353e8b4b376862ca7c95ef270697a1cc0b8d3da7de763afaf3858ded02caa', 127, 1, 'MyApp', '[]', 0, '2019-01-16 17:43:10', '2019-01-16 17:43:10', '2020-01-16 17:43:10');
INSERT INTO `oauth_access_tokens` VALUES ('814b09dc4ec5a80fc3c7ff47e25567ab445aee576e0a3dba1424e31e0df8d3c773ec2875607ced9b', 128, 1, 'MyApp', '[]', 0, '2019-01-16 17:51:25', '2019-01-16 17:51:25', '2020-01-16 17:51:25');
INSERT INTO `oauth_access_tokens` VALUES ('36b4ec2d7fc83234d8078e95493ade2691aebb5975254142240041ad3d7d452bd2d62d5ae01bfe03', 128, 1, 'MyApp', '[]', 0, '2019-01-16 17:52:14', '2019-01-16 17:52:14', '2020-01-16 17:52:14');
INSERT INTO `oauth_access_tokens` VALUES ('71cd684ce8e10dc4c9ac64b70f87c0dda2efca326c5c2cacbd0aea484cea2d6407983981f9921928', 128, 1, 'MyApp', '[]', 0, '2019-01-16 17:55:32', '2019-01-16 17:55:32', '2020-01-16 17:55:32');
INSERT INTO `oauth_access_tokens` VALUES ('5c30f08ca302d1a52e2ed81747049f55cbf0b137c2d3b46837f06139a34d6481997baf788bf8e5d2', 129, 1, 'MyApp', '[]', 0, '2019-01-16 18:10:14', '2019-01-16 18:10:14', '2020-01-16 18:10:14');
INSERT INTO `oauth_access_tokens` VALUES ('756e6ad970165adcd0865ec39d9997112e60c2f9073729b2c6fb45db1726f6144190297dc3a648a6', 128, 1, 'MyApp', '[]', 0, '2019-01-16 18:10:17', '2019-01-16 18:10:17', '2020-01-16 18:10:17');
INSERT INTO `oauth_access_tokens` VALUES ('4b564efc39798f662fb7587381279dc5a13fbad719ceb602ab8a118745849797750667eb3c8d963a', 130, 1, 'MyApp', '[]', 0, '2019-01-16 18:11:03', '2019-01-16 18:11:03', '2020-01-16 18:11:03');
INSERT INTO `oauth_access_tokens` VALUES ('6116e52499c5957d82bb31841c700e8ad13357d123e046fca837dc0c6ff70eb4fcea4c9237ca83ea', 130, 1, 'MyApp', '[]', 0, '2019-01-16 18:11:27', '2019-01-16 18:11:27', '2020-01-16 18:11:27');
INSERT INTO `oauth_access_tokens` VALUES ('75d72553eda3258c4a4bebc56b0943af773576b7ba19d729ce0710a2c405fbad2106a1da00c4ea56', 130, 1, 'MyApp', '[]', 0, '2019-01-17 09:23:12', '2019-01-17 09:23:12', '2020-01-17 09:23:12');
INSERT INTO `oauth_access_tokens` VALUES ('d1881c035eb95ab92d2ae7ead71363db25c9cb7c250b0af1a5b3e70d8bd6767dc1465b6694195830', 130, 1, 'MyApp', '[]', 0, '2019-01-17 09:24:29', '2019-01-17 09:24:29', '2020-01-17 09:24:29');
INSERT INTO `oauth_access_tokens` VALUES ('a09e4b1e45d618d121822c793495e64e89ad76326b3dd7dce8d980c4eae02b10fad6b13b152af192', 130, 1, 'MyApp', '[]', 0, '2019-01-17 09:25:02', '2019-01-17 09:25:02', '2020-01-17 09:25:02');
INSERT INTO `oauth_access_tokens` VALUES ('08e46ecd9b110661668f7ebe38e807d06df64d28f2172e58785a7eabc4c292cf0208d848847bec1e', 130, 1, 'MyApp', '[]', 0, '2019-01-17 11:02:51', '2019-01-17 11:02:51', '2020-01-17 11:02:51');
INSERT INTO `oauth_access_tokens` VALUES ('30337514d691b64daa23a4271871c424a9665bcbfebb2a3390e1565c012431d1a3aa80255c45a03e', 130, 1, 'MyApp', '[]', 0, '2019-01-17 12:03:57', '2019-01-17 12:03:57', '2020-01-17 12:03:57');
INSERT INTO `oauth_access_tokens` VALUES ('053e2fa9d0913505493ec291740a35315ae18fd946bb59d62cf30aabea9381786b25c458148cc658', 130, 1, 'MyApp', '[]', 0, '2019-01-17 12:04:07', '2019-01-17 12:04:07', '2020-01-17 12:04:07');
INSERT INTO `oauth_access_tokens` VALUES ('4b9250dde3963a69902e78bdcf024f0dd731fea2b9c5341dbf0419b1706dd557277862e4afe25057', 130, 1, 'MyApp', '[]', 0, '2019-01-17 12:12:08', '2019-01-17 12:12:08', '2020-01-17 12:12:08');
INSERT INTO `oauth_access_tokens` VALUES ('6c79dfdcd5e58addf8cc3d3045343a50e7bc2b9ab70bc29d95f40f4ad6dd3a31bac00cdf7b9142ac', 130, 1, 'MyApp', '[]', 0, '2019-01-17 13:59:36', '2019-01-17 13:59:36', '2020-01-17 13:59:36');
INSERT INTO `oauth_access_tokens` VALUES ('5baa70e2b58163266b6b0cc7da21e486fa3f35cfe6538ce499cf8dbaaecb7ffab6f25303ef6dda46', 130, 1, 'MyApp', '[]', 0, '2019-01-17 13:59:51', '2019-01-17 13:59:51', '2020-01-17 13:59:51');
INSERT INTO `oauth_access_tokens` VALUES ('bb52db7ad0b167e234fa9344516e124c47507bbf2dac29c40a04795d9e332613e7a8f70598fe65eb', 130, 1, 'MyApp', '[]', 0, '2019-01-17 18:50:46', '2019-01-17 18:50:46', '2020-01-17 18:50:46');
INSERT INTO `oauth_access_tokens` VALUES ('8078efabf4206db184f4dbb162ba996a2b4ce9987cca11b844bf8ad41305fdc3a5966bb0ad49a71b', 130, 1, 'MyApp', '[]', 0, '2019-01-17 18:56:40', '2019-01-17 18:56:40', '2020-01-17 18:56:40');
INSERT INTO `oauth_access_tokens` VALUES ('eae95cd480407f042d077c9968142cf89773c8c5a8e04574c064cfbec0be989b1f771d151ba0bc36', 130, 1, 'MyApp', '[]', 0, '2019-01-17 18:58:32', '2019-01-17 18:58:32', '2020-01-17 18:58:32');
INSERT INTO `oauth_access_tokens` VALUES ('4dabbc793b85691e2edcc4562f05a6bc90705fa14bafa615d6f9afc87f43e46ce45ac75527fb3819', 130, 1, 'MyApp', '[]', 0, '2019-01-17 19:14:20', '2019-01-17 19:14:20', '2020-01-17 19:14:20');
INSERT INTO `oauth_access_tokens` VALUES ('125d91e303e0f1d57bf4e815e915cd50101b76fd45a8f4a726bb351a89da242828d1d89d03709547', 130, 1, 'MyApp', '[]', 0, '2019-01-17 19:15:59', '2019-01-17 19:15:59', '2020-01-17 19:15:59');
INSERT INTO `oauth_access_tokens` VALUES ('f37b298030f6cd2c65f846d57e1891fbd028903a4d212c5df9c19e609f3de0d33d1ffacf911584fe', 130, 1, 'MyApp', '[]', 0, '2019-01-17 21:24:17', '2019-01-17 21:24:17', '2020-01-17 21:24:17');
INSERT INTO `oauth_access_tokens` VALUES ('de459c83ad9ac3ac30d6b1761f5574b026d9b5da90cb74835338b208670f4cd22aa1ec1a588bb7a8', 130, 1, 'MyApp', '[]', 0, '2019-01-17 21:25:27', '2019-01-17 21:25:27', '2020-01-17 21:25:27');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'Idu8hMAlR7AcQKPwXyFOHT3AMAVs9QhExHpzeyEL', 'http://localhost', 1, 0, 0, '2018-12-18 10:33:20', '2018-12-18 10:33:20');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'vqqntsvtrjFJzZtCARCy87aTYEmQbaboFLgVb9Ra', 'http://localhost', 0, 1, 0, '2018-12-18 10:33:20', '2018-12-18 10:33:20');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_personal_access_clients_client_id_index`(`client_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2018-12-18 10:33:20', '2018-12-18 10:33:20');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organization_institution
-- ----------------------------
DROP TABLE IF EXISTS `organization_institution`;
CREATE TABLE `organization_institution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacttel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactadress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mealtype` int(5) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `created_at` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spacemenu` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_institution
-- ----------------------------
INSERT INTO `organization_institution` VALUES (40, '梧桐叶', '梧桐叶', '18814137320', '福建三明', 1, 130, '6666666666666', '888888888888888', '[{\"id\":1,\"name\":\"\\u514d\\u8d39\\u578b\"}]');
INSERT INTO `organization_institution` VALUES (41, '习近平', '吴同岳', '18814137522', '福建三明', 1, 130, '5556666', '666688888888', '[{\"id\":1,\"name\":\"\\u514d\\u8d39\\u578b\"}]');
INSERT INTO `organization_institution` VALUES (103, '毛泽东', '吴同岳', '18814131230', '福建三明', 1, 130, '2019-01-17 21:23:31', '2019-01-17 21:23:31', '[{\"id\":1,\"name\":\"\\u514d\\u8d39\\u578b\"}]');
INSERT INTO `organization_institution` VALUES (104, '卢俊义', '吴同岳', '18814131232', '福建三明', 1, 130, '2019-01-17 21:25:45', '2019-01-17 21:25:45', '[{\"id\":1,\"name\":\"\\u514d\\u8d39\\u578b\"}]');
INSERT INTO `organization_institution` VALUES (102, '宋江', '吴同岳', '18814131232', '福建三明', 1, 130, '2019-01-17 21:22:52', '2019-01-17 21:22:52', '[{\"id\":1,\"name\":\"\\u514d\\u8d39\\u578b\"}]');

-- ----------------------------
-- Table structure for spacemenu
-- ----------------------------
DROP TABLE IF EXISTS `spacemenu`;
CREATE TABLE `spacemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_price` int(1) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spacemenu
-- ----------------------------
INSERT INTO `spacemenu` VALUES (1, '免费型', 0, 130);

-- ----------------------------
-- Table structure for temporary
-- ----------------------------
DROP TABLE IF EXISTS `temporary`;
CREATE TABLE `temporary`  (
  `identify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test_user
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_user
-- ----------------------------
INSERT INTO `test_user` VALUES (145, 'test0', 18, '男');
INSERT INTO `test_user` VALUES (146, 'test2', 19, '男');
INSERT INTO `test_user` VALUES (147, 'test1', 79, '女');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `unreads` int(255) NULL DEFAULT 0 COMMENT '\r\n未读消息数',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (130, '18814137329', '$2y$10$FdEzGqQGpE7o20lYXsI06uK/W9Qgg98y3cBfTICZk2g0U0Dr8yLHy', NULL, '2019-01-16 18:11:02', '2019-01-16 18:11:02', 0, 'uploads/user_logo.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vc_concact
-- ----------------------------
DROP TABLE IF EXISTS `vc_concact`;
CREATE TABLE `vc_concact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `textarea` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vc_concact
-- ----------------------------
INSERT INTO `vc_concact` VALUES (25, '马化腾', '1079051908@qq.com', '我是腾讯公司的，想与你们合作							 \r\n						', '2019-01-11 23:03:58');
INSERT INTO `vc_concact` VALUES (23, '吴同岳', '1079051908@qq.com', '我很想和龟公司合作							 \r\n						', '2019-01-11 23:00:40');

-- ----------------------------
-- Table structure for vc_test
-- ----------------------------
DROP TABLE IF EXISTS `vc_test`;
CREATE TABLE `vc_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vc_test
-- ----------------------------
INSERT INTO `vc_test` VALUES (1, 'wutongyue', 25);
INSERT INTO `vc_test` VALUES (2, 'luyongshan', 22);

SET FOREIGN_KEY_CHECKS = 1;
