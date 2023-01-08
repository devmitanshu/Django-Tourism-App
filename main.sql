BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "Tours_topthingstodo" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	varchar(5000) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"city_id"	bigint NOT NULL,
	FOREIGN KEY("city_id") REFERENCES "Tours_city"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_postimage" (
	"id"	integer NOT NULL,
	"images"	varchar(100) NOT NULL,
	"post_id"	bigint NOT NULL,
	FOREIGN KEY("post_id") REFERENCES "Tours_package"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_day" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	varchar(5000) NOT NULL,
	"package_id"	bigint NOT NULL,
	FOREIGN KEY("package_id") REFERENCES "Tours_package"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "social_auth_association" (
	"id"	integer NOT NULL,
	"server_url"	varchar(255) NOT NULL,
	"handle"	varchar(255) NOT NULL,
	"secret"	varchar(255) NOT NULL,
	"issued"	integer NOT NULL,
	"lifetime"	integer NOT NULL,
	"assoc_type"	varchar(64) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "social_auth_nonce" (
	"id"	integer NOT NULL,
	"server_url"	varchar(255) NOT NULL,
	"timestamp"	integer NOT NULL,
	"salt"	varchar(65) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "social_auth_code" (
	"id"	integer NOT NULL,
	"email"	varchar(254) NOT NULL,
	"code"	varchar(32) NOT NULL,
	"verified"	bool NOT NULL,
	"timestamp"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "social_auth_partial" (
	"id"	integer NOT NULL,
	"token"	varchar(32) NOT NULL,
	"next_step"	smallint unsigned NOT NULL CHECK("next_step" >= 0),
	"backend"	varchar(32) NOT NULL,
	"data"	text NOT NULL,
	"timestamp"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "social_auth_usersocialauth" (
	"id"	integer NOT NULL,
	"provider"	varchar(32) NOT NULL,
	"extra_data"	text NOT NULL,
	"user_id"	integer NOT NULL,
	"created"	datetime NOT NULL,
	"modified"	datetime NOT NULL,
	"uid"	varchar(255) NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_pessanger_detail" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"email"	varchar(200) NOT NULL,
	"description"	varchar(200) NOT NULL,
	"date"	date NOT NULL,
	"duration"	varchar(200) NOT NULL,
	"persons"	integer NOT NULL,
	"number"	integer NOT NULL,
	"Booked"	bool NOT NULL,
	"user_id"	integer NOT NULL,
	"package"	varchar(100) NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_pl" (
	"id"	integer NOT NULL,
	"city_name"	varchar(50) NOT NULL,
	"desc"	varchar(5000) NOT NULL,
	"date"	date NOT NULL,
	"image"	varchar(100) NOT NULL,
	"image2"	varchar(100) NOT NULL,
	"part"	varchar(100) NOT NULL,
	"tagline"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_qna" (
	"id"	integer NOT NULL,
	"question"	varchar(3000) NOT NULL,
	"answer"	varchar(5000) NOT NULL,
	"city_id"	bigint NOT NULL,
	FOREIGN KEY("city_id") REFERENCES "Tours_city"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_placestostay" (
	"id"	integer NOT NULL,
	"city_name"	varchar(50) NOT NULL,
	"desc"	varchar(5000) NOT NULL,
	"date"	date NOT NULL,
	"image"	varchar(100) NOT NULL,
	"image2"	varchar(100) NOT NULL,
	"part"	varchar(100) NOT NULL,
	"tagline"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_city" (
	"id"	integer NOT NULL,
	"city_name"	varchar(50) NOT NULL,
	"desc"	varchar(5000) NOT NULL,
	"date"	date NOT NULL,
	"image"	varchar(100) NOT NULL,
	"image2"	varchar(100) NOT NULL,
	"tagline"	varchar(100) NOT NULL,
	"part"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_staypackage" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	varchar(5000) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"place_id"	bigint NOT NULL,
	FOREIGN KEY("place_id") REFERENCES "Tours_placestostay"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "user_profile" (
	"id"	integer NOT NULL,
	"auth_token"	varchar(100) NOT NULL,
	"is_verified"	bool NOT NULL,
	"created_at"	datetime NOT NULL,
	"name"	varchar(250) NOT NULL,
	"number"	integer NOT NULL,
	"gender"	varchar(30) NOT NULL,
	"country"	varchar(80) NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	"image"	varchar(100) NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tours_package" (
	"id"	integer NOT NULL,
	"package_name"	varchar(255) NOT NULL,
	"image"	varchar(100) NOT NULL,
	"description"	varchar(5000) NOT NULL,
	"days"	integer NOT NULL,
	"nights"	integer NOT NULL,
	"price"	real NOT NULL,
	"city"	varchar(100) NOT NULL,
	"holidays"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'Tours','0001_initial','2022-07-05 09:13:17.774718');
INSERT INTO "django_migrations" VALUES (2,'contenttypes','0001_initial','2022-07-05 09:13:17.777667');
INSERT INTO "django_migrations" VALUES (3,'auth','0001_initial','2022-07-05 09:13:17.783961');
INSERT INTO "django_migrations" VALUES (4,'admin','0001_initial','2022-07-05 09:13:17.788597');
INSERT INTO "django_migrations" VALUES (5,'admin','0002_logentry_remove_auto_add','2022-07-05 09:13:17.806042');
INSERT INTO "django_migrations" VALUES (6,'admin','0003_logentry_add_action_flag_choices','2022-07-05 09:13:17.810511');
INSERT INTO "django_migrations" VALUES (7,'contenttypes','0002_remove_content_type_name','2022-07-05 09:13:17.819503');
INSERT INTO "django_migrations" VALUES (8,'auth','0002_alter_permission_name_max_length','2022-07-05 09:13:17.827632');
INSERT INTO "django_migrations" VALUES (9,'auth','0003_alter_user_email_max_length','2022-07-05 09:13:17.832109');
INSERT INTO "django_migrations" VALUES (10,'auth','0004_alter_user_username_opts','2022-07-05 09:13:17.834775');
INSERT INTO "django_migrations" VALUES (11,'auth','0005_alter_user_last_login_null','2022-07-05 09:13:17.838413');
INSERT INTO "django_migrations" VALUES (12,'auth','0006_require_contenttypes_0002','2022-07-05 09:13:17.838965');
INSERT INTO "django_migrations" VALUES (13,'auth','0007_alter_validators_add_error_messages','2022-07-05 09:13:17.841432');
INSERT INTO "django_migrations" VALUES (14,'auth','0008_alter_user_username_max_length','2022-07-05 09:13:17.845371');
INSERT INTO "django_migrations" VALUES (15,'auth','0009_alter_user_last_name_max_length','2022-07-05 09:13:17.848957');
INSERT INTO "django_migrations" VALUES (16,'auth','0010_alter_group_name_max_length','2022-07-05 09:13:17.852616');
INSERT INTO "django_migrations" VALUES (17,'auth','0011_update_proxy_permissions','2022-07-05 09:13:17.856124');
INSERT INTO "django_migrations" VALUES (18,'auth','0012_alter_user_first_name_max_length','2022-07-05 09:13:17.861189');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2022-07-05 09:13:17.863408');
INSERT INTO "django_migrations" VALUES (20,'user','0001_initial','2022-07-05 09:13:17.867338');
INSERT INTO "django_migrations" VALUES (21,'Tours','0002_day_package_postimage_topthingstodo','2022-07-05 09:14:54.422469');
INSERT INTO "django_migrations" VALUES (22,'Tours','0003_pessanger_detail','2022-07-05 09:20:35.554932');
INSERT INTO "django_migrations" VALUES (23,'Tours','0004_pessanger_detail_package','2022-07-05 09:20:51.901315');
INSERT INTO "django_migrations" VALUES (24,'default','0001_initial','2022-07-05 10:31:14.818601');
INSERT INTO "django_migrations" VALUES (25,'social_auth','0001_initial','2022-07-05 10:31:14.819380');
INSERT INTO "django_migrations" VALUES (26,'default','0002_add_related_name','2022-07-05 10:31:14.824883');
INSERT INTO "django_migrations" VALUES (27,'social_auth','0002_add_related_name','2022-07-05 10:31:14.825307');
INSERT INTO "django_migrations" VALUES (28,'default','0003_alter_email_max_length','2022-07-05 10:31:14.831506');
INSERT INTO "django_migrations" VALUES (29,'social_auth','0003_alter_email_max_length','2022-07-05 10:31:14.831836');
INSERT INTO "django_migrations" VALUES (30,'default','0004_auto_20160423_0400','2022-07-05 10:31:14.840170');
INSERT INTO "django_migrations" VALUES (31,'social_auth','0004_auto_20160423_0400','2022-07-05 10:31:14.840475');
INSERT INTO "django_migrations" VALUES (32,'social_auth','0005_auto_20160727_2333','2022-07-05 10:31:14.842525');
INSERT INTO "django_migrations" VALUES (33,'social_django','0006_partial','2022-07-05 10:31:14.844871');
INSERT INTO "django_migrations" VALUES (34,'social_django','0007_code_timestamp','2022-07-05 10:31:14.849942');
INSERT INTO "django_migrations" VALUES (35,'social_django','0008_partial_timestamp','2022-07-05 10:31:14.854595');
INSERT INTO "django_migrations" VALUES (36,'social_django','0009_auto_20191118_0520','2022-07-05 10:31:14.870258');
INSERT INTO "django_migrations" VALUES (37,'social_django','0010_uid_db_index','2022-07-05 10:31:14.878227');
INSERT INTO "django_migrations" VALUES (38,'social_django','0003_alter_email_max_length','2022-07-05 10:31:14.879669');
INSERT INTO "django_migrations" VALUES (39,'social_django','0002_add_related_name','2022-07-05 10:31:14.880488');
INSERT INTO "django_migrations" VALUES (40,'social_django','0001_initial','2022-07-05 10:31:14.881231');
INSERT INTO "django_migrations" VALUES (41,'social_django','0004_auto_20160423_0400','2022-07-05 10:31:14.881818');
INSERT INTO "django_migrations" VALUES (42,'social_django','0005_auto_20160727_2333','2022-07-05 10:31:14.882389');
INSERT INTO "django_migrations" VALUES (43,'Tours','0005_alter_package_city','2022-07-05 12:35:29.140037');
INSERT INTO "django_migrations" VALUES (44,'Tours','0006_alter_pessanger_detail_package','2022-07-05 12:48:33.590513');
INSERT INTO "django_migrations" VALUES (45,'Tours','0007_pl_qna','2022-07-05 15:20:22.898899');
INSERT INTO "django_migrations" VALUES (46,'Tours','0008_auto_20220705_2143','2022-07-05 16:13:25.836650');
INSERT INTO "django_migrations" VALUES (47,'Tours','0009_staypackage','2022-07-05 18:53:05.296229');
INSERT INTO "django_migrations" VALUES (48,'Tours','0010_alter_package_city','2022-07-07 18:15:01.301178');
INSERT INTO "django_migrations" VALUES (49,'user','0002_alter_profile_image','2022-07-07 18:15:01.670125');
INSERT INTO "django_migrations" VALUES (50,'user','0003_alter_profile_image','2022-07-07 18:20:36.459194');
INSERT INTO "django_migrations" VALUES (51,'Tours','0011_alter_package_holidays','2022-07-07 18:57:14.608157');
INSERT INTO "django_admin_log" VALUES (1,'2022-07-05 11:13:26.120328','2','mahima123','[{"changed": {"fields": ["password"]}}]',6,1,2);
INSERT INTO "django_admin_log" VALUES (2,'2022-07-05 12:33:39.217777','1','Madhya Pradesh','[{"added": {}}]',1,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2022-07-05 12:38:12.829447','1','Bandhavgarh National Park','[{"added": {}}, {"added": {"name": "day", "object": "Bandhavgarh National Park"}}, {"added": {"name": "day", "object": "Bandhavgarh National Park"}}, {"added": {"name": "day", "object": "Bandhavgarh National Park"}}, {"added": {"name": "post image", "object": "Bandhavgarh National Park"}}, {"added": {"name": "post image", "object": "Bandhavgarh National Park"}}, {"added": {"name": "post image", "object": "Bandhavgarh National Park"}}]',12,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2022-07-05 12:43:39.642221','1','mahima','[{"changed": {"fields": ["Package", "Booked"]}}]',13,1,2);
INSERT INTO "django_admin_log" VALUES (5,'2022-07-05 12:49:52.185440','1','mahima','[{"changed": {"fields": ["Package"]}}]',13,1,2);
INSERT INTO "django_admin_log" VALUES (6,'2022-07-05 15:23:51.530202','2','User1','[{"changed": {"fields": ["Package", "Booked"]}}]',13,7,2);
INSERT INTO "django_admin_log" VALUES (7,'2022-07-05 15:32:20.194043','1','Madhya Pradesh','[{"added": {"name": "qn a", "object": "Madhya Pradesh"}}, {"added": {"name": "qn a", "object": "Madhya Pradesh"}}]',1,7,2);
INSERT INTO "django_admin_log" VALUES (8,'2022-07-05 16:14:49.519308','1','Goa Beach','[{"added": {}}]',21,7,1);
INSERT INTO "django_admin_log" VALUES (9,'2022-07-05 19:30:42.366113','1','Goa Beach','[{"added": {"name": "staypackage", "object": "Hotel 1"}}]',21,7,2);
INSERT INTO "django_admin_log" VALUES (10,'2022-07-06 10:02:07.530574','2','Maharashtra','[{"added": {}}, {"added": {"name": "top things to do", "object": "Maharashtra"}}, {"added": {"name": "top things to do", "object": "Maharashtra"}}, {"added": {"name": "top things to do", "object": "Maharashtra"}}, {"added": {"name": "qn a", "object": "Maharashtra"}}, {"added": {"name": "qn a", "object": "Maharashtra"}}]',1,7,1);
INSERT INTO "django_admin_log" VALUES (11,'2022-07-06 10:15:02.952143','2','Udaipur','[{"added": {}}, {"added": {"name": "staypackage", "object": "AARAM BAGH"}}, {"added": {"name": "staypackage", "object": "CAMBAY RESORT"}}]',21,7,1);
INSERT INTO "django_admin_log" VALUES (12,'2022-07-06 11:30:12.626849','1','Goa Beach','[{"added": {"name": "staypackage", "object": "LA CALYPSO HOTEL"}}, {"added": {"name": "staypackage", "object": "THE PARK CALANGUTE"}}, {"added": {"name": "staypackage", "object": "NEELAM''S THE GRAND"}}, {"added": {"name": "staypackage", "object": "CITRUS GOA"}}]',21,7,2);
INSERT INTO "django_admin_log" VALUES (13,'2022-07-07 18:51:01.168491','3','Goa','[{"added": {}}, {"added": {"name": "top things to do", "object": "Goa"}}]',1,7,1);
INSERT INTO "django_admin_log" VALUES (14,'2022-07-07 18:55:08.201429','3','Goa','[{"changed": {"fields": ["Desc"]}}]',1,7,2);
INSERT INTO "django_admin_log" VALUES (15,'2022-07-07 18:58:58.893185','2','Beach','[{"added": {}}, {"added": {"name": "day", "object": "Beach"}}, {"added": {"name": "day", "object": "Beach"}}, {"added": {"name": "day", "object": "Beach"}}, {"added": {"name": "post image", "object": "Beach"}}, {"added": {"name": "post image", "object": "Beach"}}, {"added": {"name": "post image", "object": "Beach"}}]',12,7,1);
INSERT INTO "django_content_type" VALUES (1,'Tours','city');
INSERT INTO "django_content_type" VALUES (2,'user','profile');
INSERT INTO "django_content_type" VALUES (3,'admin','logentry');
INSERT INTO "django_content_type" VALUES (4,'auth','permission');
INSERT INTO "django_content_type" VALUES (5,'auth','group');
INSERT INTO "django_content_type" VALUES (6,'auth','user');
INSERT INTO "django_content_type" VALUES (7,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (8,'sessions','session');
INSERT INTO "django_content_type" VALUES (9,'Tours','topthingstodo');
INSERT INTO "django_content_type" VALUES (10,'Tours','day');
INSERT INTO "django_content_type" VALUES (11,'Tours','postimage');
INSERT INTO "django_content_type" VALUES (12,'Tours','package');
INSERT INTO "django_content_type" VALUES (13,'Tours','pessanger_detail');
INSERT INTO "django_content_type" VALUES (14,'social_django','association');
INSERT INTO "django_content_type" VALUES (15,'social_django','code');
INSERT INTO "django_content_type" VALUES (16,'social_django','nonce');
INSERT INTO "django_content_type" VALUES (17,'social_django','usersocialauth');
INSERT INTO "django_content_type" VALUES (18,'social_django','partial');
INSERT INTO "django_content_type" VALUES (19,'Tours','pl');
INSERT INTO "django_content_type" VALUES (20,'Tours','qna');
INSERT INTO "django_content_type" VALUES (21,'Tours','placestostay');
INSERT INTO "django_content_type" VALUES (22,'Tours','staypackage');
INSERT INTO "auth_permission" VALUES (1,1,'add_city','Can add city');
INSERT INTO "auth_permission" VALUES (2,1,'change_city','Can change city');
INSERT INTO "auth_permission" VALUES (3,1,'delete_city','Can delete city');
INSERT INTO "auth_permission" VALUES (4,1,'view_city','Can view city');
INSERT INTO "auth_permission" VALUES (5,2,'add_profile','Can add profile');
INSERT INTO "auth_permission" VALUES (6,2,'change_profile','Can change profile');
INSERT INTO "auth_permission" VALUES (7,2,'delete_profile','Can delete profile');
INSERT INTO "auth_permission" VALUES (8,2,'view_profile','Can view profile');
INSERT INTO "auth_permission" VALUES (9,3,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (10,3,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (11,3,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (12,3,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (13,4,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (14,4,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (15,4,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (16,4,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (17,5,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (18,5,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (19,5,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (20,5,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (21,6,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (22,6,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (23,6,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (24,6,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (25,7,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (26,7,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (27,7,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (28,7,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (29,8,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (30,8,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (31,8,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (32,8,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (33,9,'add_topthingstodo','Can add top things to do');
INSERT INTO "auth_permission" VALUES (34,9,'change_topthingstodo','Can change top things to do');
INSERT INTO "auth_permission" VALUES (35,9,'delete_topthingstodo','Can delete top things to do');
INSERT INTO "auth_permission" VALUES (36,9,'view_topthingstodo','Can view top things to do');
INSERT INTO "auth_permission" VALUES (37,10,'add_day','Can add day');
INSERT INTO "auth_permission" VALUES (38,10,'change_day','Can change day');
INSERT INTO "auth_permission" VALUES (39,10,'delete_day','Can delete day');
INSERT INTO "auth_permission" VALUES (40,10,'view_day','Can view day');
INSERT INTO "auth_permission" VALUES (41,11,'add_postimage','Can add post image');
INSERT INTO "auth_permission" VALUES (42,11,'change_postimage','Can change post image');
INSERT INTO "auth_permission" VALUES (43,11,'delete_postimage','Can delete post image');
INSERT INTO "auth_permission" VALUES (44,11,'view_postimage','Can view post image');
INSERT INTO "auth_permission" VALUES (45,12,'add_package','Can add package');
INSERT INTO "auth_permission" VALUES (46,12,'change_package','Can change package');
INSERT INTO "auth_permission" VALUES (47,12,'delete_package','Can delete package');
INSERT INTO "auth_permission" VALUES (48,12,'view_package','Can view package');
INSERT INTO "auth_permission" VALUES (49,13,'add_pessanger_detail','Can add pessanger_detail');
INSERT INTO "auth_permission" VALUES (50,13,'change_pessanger_detail','Can change pessanger_detail');
INSERT INTO "auth_permission" VALUES (51,13,'delete_pessanger_detail','Can delete pessanger_detail');
INSERT INTO "auth_permission" VALUES (52,13,'view_pessanger_detail','Can view pessanger_detail');
INSERT INTO "auth_permission" VALUES (53,14,'add_association','Can add association');
INSERT INTO "auth_permission" VALUES (54,14,'change_association','Can change association');
INSERT INTO "auth_permission" VALUES (55,14,'delete_association','Can delete association');
INSERT INTO "auth_permission" VALUES (56,14,'view_association','Can view association');
INSERT INTO "auth_permission" VALUES (57,15,'add_code','Can add code');
INSERT INTO "auth_permission" VALUES (58,15,'change_code','Can change code');
INSERT INTO "auth_permission" VALUES (59,15,'delete_code','Can delete code');
INSERT INTO "auth_permission" VALUES (60,15,'view_code','Can view code');
INSERT INTO "auth_permission" VALUES (61,16,'add_nonce','Can add nonce');
INSERT INTO "auth_permission" VALUES (62,16,'change_nonce','Can change nonce');
INSERT INTO "auth_permission" VALUES (63,16,'delete_nonce','Can delete nonce');
INSERT INTO "auth_permission" VALUES (64,16,'view_nonce','Can view nonce');
INSERT INTO "auth_permission" VALUES (65,17,'add_usersocialauth','Can add user social auth');
INSERT INTO "auth_permission" VALUES (66,17,'change_usersocialauth','Can change user social auth');
INSERT INTO "auth_permission" VALUES (67,17,'delete_usersocialauth','Can delete user social auth');
INSERT INTO "auth_permission" VALUES (68,17,'view_usersocialauth','Can view user social auth');
INSERT INTO "auth_permission" VALUES (69,18,'add_partial','Can add partial');
INSERT INTO "auth_permission" VALUES (70,18,'change_partial','Can change partial');
INSERT INTO "auth_permission" VALUES (71,18,'delete_partial','Can delete partial');
INSERT INTO "auth_permission" VALUES (72,18,'view_partial','Can view partial');
INSERT INTO "auth_permission" VALUES (73,19,'add_pl','Can add pl');
INSERT INTO "auth_permission" VALUES (74,19,'change_pl','Can change pl');
INSERT INTO "auth_permission" VALUES (75,19,'delete_pl','Can delete pl');
INSERT INTO "auth_permission" VALUES (76,19,'view_pl','Can view pl');
INSERT INTO "auth_permission" VALUES (77,20,'add_qna','Can add qn a');
INSERT INTO "auth_permission" VALUES (78,20,'change_qna','Can change qn a');
INSERT INTO "auth_permission" VALUES (79,20,'delete_qna','Can delete qn a');
INSERT INTO "auth_permission" VALUES (80,20,'view_qna','Can view qn a');
INSERT INTO "auth_permission" VALUES (81,21,'add_placestostay','Can add placestostay');
INSERT INTO "auth_permission" VALUES (82,21,'change_placestostay','Can change placestostay');
INSERT INTO "auth_permission" VALUES (83,21,'delete_placestostay','Can delete placestostay');
INSERT INTO "auth_permission" VALUES (84,21,'view_placestostay','Can view placestostay');
INSERT INTO "auth_permission" VALUES (85,22,'add_staypackage','Can add staypackage');
INSERT INTO "auth_permission" VALUES (86,22,'change_staypackage','Can change staypackage');
INSERT INTO "auth_permission" VALUES (87,22,'delete_staypackage','Can delete staypackage');
INSERT INTO "auth_permission" VALUES (88,22,'view_staypackage','Can view staypackage');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$e0JL3ukQKUa3aV3vr0Y7vp$gzz73joB5dDHZIusRwHIRGsMKIA28DXr5JjvRYb2udE=','2022-07-05 12:49:44.312467',1,'root','','',1,1,'2022-07-05 09:21:45.382343','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$260000$nw0b6ff2aq0ZFyQMSEUw7L$1lf9qseLf7x/0/fmbEe5qFPVZDhAMW7zsJ/kjovfmn4=','2022-07-05 11:24:41.508330',0,'mahima123','','mahimatanwani333@gmail.com',0,1,'2022-07-05 09:54:12.868107','');
INSERT INTO "auth_user" VALUES (3,'pbkdf2_sha256$260000$B96fuWtVWthmEuKZoEjThn$1K7uRn7zWLR/HTdmNSQFhq0fsAqaHu5kzV0Bvn+l+q4=','2022-07-05 11:39:33.735167',0,'som','','som@gmail.com',0,1,'2022-07-05 11:39:24.728188','');
INSERT INTO "auth_user" VALUES (4,'pbkdf2_sha256$260000$zxoOFiopA0GI7MwKyZW3E3$LGT/7zx8il8D5JfR0gNUluurIia+sgkm3S0dD0CqzAo=',NULL,0,'som123','','som@gmail.com',0,1,'2022-07-05 11:48:01.649743','');
INSERT INTO "auth_user" VALUES (5,'pbkdf2_sha256$260000$6gOlxSADON91K546CygC4R$RYMoK9NE12gj34ZsymUlhFCJo/tE8gwzfkoxEe6XInw=','2022-07-07 13:22:57.152135',0,'mitanshu','','mitanshu@gmail.com',0,1,'2022-07-05 11:49:37.102827','');
INSERT INTO "auth_user" VALUES (6,'pbkdf2_sha256$260000$dgw997lPdQwdzqeQebvMjv$h2cJiE8TutpURqmn4QX/9uMB3ExF2bSyTvmOuswub78=','2022-07-08 10:13:08.940244',0,'user1','','user@gmail.com',0,1,'2022-07-05 15:06:47.447059','');
INSERT INTO "auth_user" VALUES (7,'pbkdf2_sha256$390000$b6wWD293bomJ4IsP9LILgg$MspuJ4Z6tajqjUmVGrGcWUBbwH259zPltuRRZjLTQ48=','2022-10-27 13:44:26.658195',1,'Mitanshu','','',1,1,'2022-07-05 15:21:06.020413','');
INSERT INTO "auth_user" VALUES (8,'pbkdf2_sha256$320000$t8TaQwjFf86hEMfSoUNtWe$HdYLPvVxzLW+ob4kgZsnEZvzsNh3lAFhF88f5D1txiA=','2022-07-07 08:28:55.629043',0,'abc','','abc@example.com',0,1,'2022-07-07 05:56:02.586813','');
INSERT INTO "auth_user" VALUES (9,'pbkdf2_sha256$390000$XCN80px76eZCA6zEf87Qg0$NSu4SyicxEThHCGYgk4QTOB85q4xaYZFfeTSWlgv7Ew=','2022-11-01 08:00:30.079285',0,'Mit','','abc@gmail.com',0,1,'2022-11-01 08:00:12.523727','');
INSERT INTO "django_session" VALUES ('etcpk2309edp3ivk038hwbe804jfcr3u','.eJxVjDEOwyAQBP9CHSEsAwcp0-cN6IC74CQCydiVlb_Hlty4W83O7iamLO7uJgKuSwlrpzkcRDhxYRHTh-pR5DfWV5Op1WWeojwUebZdPlum7-N0LwcFe9nXZB0kReSc0dF7ThqURSJSbBAyqtEwoWYDbIc9AaYIw-jJsgM2Rvz-M006nQ:1o9L5y:37IrZ-fJyXXnZhk-HhSJGYZL4golQ41wuoiyP8BbT1E','2022-07-21 06:34:38.085741');
INSERT INTO "django_session" VALUES ('3soid9huainv2qbmny5vbd6lwx26w57u','.eJxVjDsOwyAQBe9CHSHzWcKmTO8zWMsCwUkEkj9VlLsnSG7czsx7HzFHcYOLmGjfyrSvaZk6ESBOLBC_Uu0iPqk-muRWt2UOsifysKscW0zv-9GeDgqt5b925JF1dleFbEG7EFNEUGC1AU7Z5ME6cswZjRrYe-czcdAYbQJAzOL7AwecOaQ:1o9RT7:sZcMRzMrzh_2O2_UeIt_MP8IldY4cTPpwQVx0-leuNA','2022-07-21 13:22:57.154039');
INSERT INTO "django_session" VALUES ('3lw8cu67fumndit2bnoh7rpt4bxzb3yp','.eJxVjEEOwiAQRe8ya0MKFGZw6b5naIYBbdXQpLQr492VpJtu33v_f2BOcA0XGHnfpnGveR0bgQAnFlleuTSRnlwei5KlbOscVUvUYasalpTft6M9HUxcp__6HrHrkzhGT2y1GEPexkyotaYOgxVxLlKiPuZEpmcfvHOW0Bs0KAa-P_uQOH0:1opmCE:AefUOySgqlb-m8Z5bree7ZcUwrwTr7NwM08xEQG2S7g','2022-11-15 08:00:30.233411');
INSERT INTO "Tours_topthingstodo" VALUES (1,'ASHTAVINAYAK YATRA WITH SHIRDI','The Ashtavinayak Yatra with Shirdi is the 3 nights / 4 days tour package takes you to the enchanting journey of visiting the religiously significant Sai Baba Temple, followed by the visit to the eight ancient holy temples of Lord Ganesha that are scattered in the nearby beautiful and scenically blessed villages of Pune, all together called Ashtavinayak Yatra. Though, they are all dedicated to one God but the idols adorning each temple are distinctly different, and so as the historical tale behind its existence. But one surprising fact that amazes the tourists is the natural emergence of all the eight temples from within the Mother earth. Starting with Moreshwar (Morgaon), the trip takes you to Siddhivinayak (Siddhatek), Ballaleshwar (Pali), Varad Vinayak (Mahad), Chintamani Vinayak (Theur), Girijatmaj (Lenyadri), Vighneshwar (Ozar), Mahaganapati (Ranjangaon), and then again to Moreshwar (Morgaon), because it is believed that the Yatra completes only after the visit to the first temple again. As far as planning for the comfortable accommodation and transport service is concerned, Tour My India Team is there to manage it all for you with assurance of no possibility of any disappointment.','Tours/images/ashtavinayak-yatra-with-shirdi1_gBe55Jq.jpg',2);
INSERT INTO "Tours_topthingstodo" VALUES (2,'NASHIK SHIRDI TOUR WITH BHIMASHANKAR','The ancient holy city- Nashik has immense beauty enhanced by its architecturally blessed and religiously significant temples, that attracts plethora of tourists every year and enchants them with a spell-binding experience. Trimbakeshwar, which is one of the 12 Jyotirlinga in India, that is considered to be very sacred among hindus, also resides here along with other awe-inspiring holy places like Kapaleeshwar Temple, Sundarnarayan Temple, Naroshankar Temple, Goraram Mandir, Muktidham, Kalaram Mandir, Sita Gumpha, etc that are all included in the 2 nights / 3 days well-designed package by Tour My India, that will include the tour to famous Sai Baba Mandir at Shirdi with local sightseeing. While on the way back, detour to Bhimashankar Temple near Pune, quench the never-ending desire to connect with God and get enlightened. Also, for a comfortable travelling experience, the best of the hotels is booked supplies with all required amenities and prompt transport service','Tours/images/nashik-shirdi-bhimashankar1_St6R4Cy.jpg',2);
INSERT INTO "Tours_topthingstodo" VALUES (3,'MAHARASHTRA TEMPLE TOUR','While getting mesmerised with the excellent scenic views on the way, enjoy the 4 nights / 5 days tour package curated by Tour My India, for visiting the famous temples of Maharashtra. The very sacred Trimbakeshwar Temple, which is one of the 12 jyotirlingas spread across the country, is situated in Nashik; the ancient holy city that carries many other popular temples and religious places that are soul enriching and peace giving. Another popular temple that’s covered in the package, was a unifying factor for Hindus and Muslims i.e Sai Baba Temple at Shirdi, which is devoted to a spiritual master revered by both Hindu and Muslim devotees equally. Dwell into the Maratha architecture in Aurangabad, and explore along the World heritage site - Ellora caves, sprawled amidst lush greenery that surely calls for a visit. Apart from Trimbakeshwar, the tour covers four more jyotirlingas, located in Aurangabad, Parli and Bhimashankar which is near to Pune. These visits altogether gives an enlightening experience that tourist will remember for a lifetime. To make you at ease during the trip, the booking in a good hotel and the availability of prompt transport is made available to you by out Tour My India team.','Tours/images/temple-tour1_l6DfYYY.jpg',2);
INSERT INTO "Tours_topthingstodo" VALUES (4,'Hotel 1','The Ashtavinayak Yatra with Shirdi is the 3 nights / 4 days tour package takes you to the enchanting journey of visiting the religiously significant Sai Baba Temple, followed by the visit to the eight ancient holy temples of Lord Ganesha that are scattered in the nearby beautiful and scenically blessed villages of Pune, all together called Ashtavinayak Yatra. Though, they are all dedicated to one God but the idols adorning each temple are distinctly different, and so as the historical tale behind its existence. But one surprising fact that amazes the tourists is the natural emergence of all the eight temples from within the Mother earth. Starting with Moreshwar (Morgaon), the trip takes you to Siddhivinayak (Siddhatek), Ballaleshwar (Pali), Varad Vinayak (Mahad), Chintamani Vinayak (Theur), Girijatmaj (Lenyadri), Vighneshwar (Ozar), Mahaganapati (Ranjangaon), and then again to Moreshwar (Morgaon), because it is believed that the Yatra completes only after the visit to the first temple again. As far as plannin','Tours/images/Bandhavgarh-2_5S09fEY_A0GfXCI.jpeg',3);
INSERT INTO "Tours_postimage" VALUES (1,'Tours/images/Bandhavgarh-2_5S09fEY.jpeg',1);
INSERT INTO "Tours_postimage" VALUES (2,'Tours/images/Bandhavgarh-3_6drzxyP.jpeg',1);
INSERT INTO "Tours_postimage" VALUES (3,'Tours/images/Bandhavgarh-4_P3gdf5l.jpeg',1);
INSERT INTO "Tours_postimage" VALUES (4,'Tours/images/Bandhavgarh-2_czPLbX6.jpeg',2);
INSERT INTO "Tours_postimage" VALUES (5,'Tours/images/Bandhavgarh-4_P3gdf5l_wGraMYa.jpeg',2);
INSERT INTO "Tours_postimage" VALUES (6,'Tours/images/cambay-resort-udaipurr_ZhDqGJO_HjrBAXE.jpg',2);
INSERT INTO "Tours_day" VALUES (1,'Umaria - Bandhavgarh National Park','On arrival at Umaria railway station, meet our representative who will be there for your welcome. After a warm welcome on the station, he will straightway take you to pre-booked resort. Check in at the resort and get freshen up. Enjoy mouth-watering lunch that will be served in the in-house restaurant of the resort. Rest of the day is free for leisure. During your leisure time, you can sit beside the pool and enjoy the fresh air or enjoy leisure walk in and around the resort premises. Later in the evening, enjoy hot coffee/tea with some delicious evening snacks. Take pleasure of dinner followed by an overnight stay in your resort in Bandhavgarh National Park.',1);
INSERT INTO "Tours_day" VALUES (2,'Adventurous Junlge Safari in Bandhavgarh National Park','Today, we will start our day quite early in the morning to experience an early morning Jungle Safari. Before leaving for this adventure activity, we will sip hot served bed tea with some biscuits by the resort staff. This morning jungle safari in Bandhavgarh National Park will be very exciting especially for all those who will be visiting for the first time and leave you with many unforgettable moments. After enjoy the safari for about 4 hours, we will return back to the resort for lunch. Thereafter, you can rest for some time and again get ready for another safari tour i.e. the evening safari tour which will begin at 14:30 PM in winter and 15:30 pm in summer. This way, once again you can have that kicking experience that you have experienced prior in the morning. The duration of evening safari is three hours. So, after completing your evening jungle safari, return back to the resort and have your evening tea. Enjoy lavish dinner followed by an overnight stay in the resort.',1);
INSERT INTO "Tours_day" VALUES (3,'Bandavgarh National Park - Umaria','In the morning after breakfast, we will check- out of the resort to drive back to Umaria railway station to board the train for your onward journey. Tour & services Ends.',1);
INSERT INTO "Tours_day" VALUES (4,'Hotel 1','Surrounded by the lush Aravali hills, Aaram Baagh is nestled on Ahmedabad-Udaipur highway. This 3 star hotel depicts the history of mewar royals. The hotel has traditional exteriors and magnificently carved balconies, which add an ideal heritage atmosphere to the place. It is well equipped with indoor and outdoor pools for rejuvenation. There are elegantly designed villas overlooking the magnificent views of the city.',2);
INSERT INTO "Tours_day" VALUES (5,'CAMBAY RESORT','Feel the royal culture and have a luxury stay at Cambay Resort in Udaipur, which is sprawled over an area of 11407 square meters. Featured with Pool & Mountain View, and Executive Suite rooms with beautiful interiors and modern amenities, the interior of this four star hotel is inspired by the city''s unparalleled architectural eminence located against a scenic setting of hills. There are four well equipped on-site banquet halls namely Lords, Viceroy, Lawn and Premiere, where guests can conduct their conference & official meetings, wedding function or social gatherings.',2);
INSERT INTO "Tours_day" VALUES (6,'THE PARK CALANGUTE','Located on Calangute Beach in North Goa, The Park Calangute is a seafront 5 star resort tastefully designed for all those seeking for luxury comfort and hassle free accommodation services. It is the only resort of such kind in North Goa. This luxurious resort is blessed with all advance facilities to offer a lavish lodging experience to its guests. After exploring the town and its major attractions, guests can relax in an open-air lounge, enjoy fresh air and capture some breathtaking outside views of the blue ocean.',2);
INSERT INTO "Tours_pessanger_detail" VALUES (1,'mahima','mahima@gmail.com','MP','2022-07-13','5',4,1234567890,1,5,'Bandhavgarh National Park');
INSERT INTO "Tours_pessanger_detail" VALUES (2,'User1','user@gmail.com','MP','2022-07-06','3',3,4856585268,1,6,'Bandhavgarh National Park');
INSERT INTO "Tours_pessanger_detail" VALUES (3,'User','user@gmail.com','Goa','2022-06-30','3',3,5468658526,0,6,'');
INSERT INTO "Tours_pessanger_detail" VALUES (4,'User1','user@gmail.com','Goa','2022-07-06','3',3,5468658526,0,6,'');
INSERT INTO "Tours_pessanger_detail" VALUES (5,'user1','user@gmail.com','MP','2022-07-08','3',3,5468658526,0,6,'');
INSERT INTO "Tours_pessanger_detail" VALUES (6,'User1','user@gmail.com','MP','2022-07-13','3',3,4856585268,0,6,'');
INSERT INTO "Tours_pessanger_detail" VALUES (7,'Mitanshu','mitanshuholkar35@gmail.com','MP','2022-07-06','3',3,4856585268,0,6,'');
INSERT INTO "Tours_qna" VALUES (1,'Why to visit Madhya Pradesh','It has a cleanest city which is indore.',1);
INSERT INTO "Tours_qna" VALUES (2,'Why it is famous?','Because of its heritage and culture.',1);
INSERT INTO "Tours_qna" VALUES (3,'When to Visit Maharashtra','Monsoons here begin in the month of June and retreat by the month of September. The month of July is the wettest, and August too witnesses substantial rains. Monsoon season is not considered an apt time for a travel to this destination, as heavy rainfall disrupts outdoor activities.',2);
INSERT INTO "Tours_qna" VALUES (4,'Maharashtra Travel by Train','Maharashtra is accomplished with hundreds of railway stations, that establishes good railway web bridging the state with other parts of the country. Among all, some of the major railway stations in Maharashtra are Mumbai, Pune, Nashik, Jalgaon and Nagpur, which are very well inter-connected within and outside the state, providing with good opportunity for the travellers from all over the country to explore the beautiful places of Maharashtra, by directly reaching here.',2);
INSERT INTO "Tours_placestostay" VALUES (1,'Goa Beach','See Goa Packages','2022-07-05','Tours/images/christopher-jolly-GqbU78bdJFM-unsplash.jpg','Tours/images/christopher-jolly-GqbU78bdJFM-unsplash_MbLNM9g.jpg','City-Wise','Welcome to goa');
INSERT INTO "Tours_placestostay" VALUES (2,'Udaipur','Udaipur also known as City of Lakes is among the jewel cities in Rajasthan. The splendid palaces and forts make this destination immaculate. Holding the ancient cultural baton of Rajasthan, Udaipur is a city with paramount serenity. The tourists find this place extremely arresting and thus it is swarmed by travelers all round the year.There is an assortment of hotels in Udaipur satiating the search of comfort in the tourists. Without a doubt, Udaipur offers some of the finest places in India to stay at.','2022-07-27','Tours/images/golden-triangle-tour2_J0OtNox.jpg','Tours/images/Bandhavgarh-3_RdI3q2G_WU2xHno.jpeg','Luxury Hotels','Welcome to Udaipur');
INSERT INTO "Tours_city" VALUES (1,'Madhya Pradesh','Madhya Pradesh is a state in central India. Its capital is Bhopal, and the largest city is Indore, with Jabalpur, Ujjain, Gwalior, Satna, and Guna being the other major cities. Madhya Pradesh is the second largest Indian state by area and the fifth largest state by population with over 72 million residents. It borders the states of Uttar Pradesh to the northeast, Chhattisgarh to the southeast, Maharashtra to the south, Gujarat to the west, and Rajasthan to the northwest.  The area covered by the present-day Madhya Pradesh includes the area of the ancient Avanti Mahajanapada, whose capital Ujjain (also known as Avantika) arose as a major city during the second wave of Indian urbanisation in the sixth century BCE. Subsequently, the region was ruled by the major dynasties of India. The Maratha Empire dominated the majority of the 18th century.','2022-07-05','Tours/images/Khajuraho_Dulhadeo_2010_2BjhXNO.jpg','Tours/images/Khajuraho_Dulhadeo_2010_jveN3b2.jpg','Visit the Central part of India','Central India');
INSERT INTO "Tours_city" VALUES (2,'Maharashtra','Certainly unsullied, the state of Maharashtra is ornamented with jewels of diversity, some precious, semi precious and some are well hidden gems. Serene Beaches; lofty mountains; awe-inspiring historic monuments and ancient sites culminate to result in a magical place like Maharashtra. A prominent paradox can be witnessed, where one part of the state like Mumbai and Pune enjoy modern life and amenities, the other parts like Matheran, Lonavala, Mahabaleshwar are satiated with the rustic life and serenity of the landscape. Maharashtra is humbled by the existence of Shirdi, which is the hometown to the holy Sai Baba and is a popular tourist attractions, whereas, Aurangabad (Ajanta and Ellora caves and Bibi ka Maqbara) gives Maharashtra a chance to be boastful of its rich history and making it an important sightseeing place. Sugar-coating the experience of holidays in Maharashtra are the destinations like Ganpatipule and Tarkarli,  which with their tranquil settings and scenic views can impress anyone. The long Konkan Coastline; the far east located national parks (Tadoba National Park); the vineyards of Nasik; the cuisine and footwear of Kolhapur and the centre of alternative spiritualism in Pune further enhances the charm of Maharashtra tour.  At Tour My India, we create and design tour packages in India that caters to all the requirements of travel enthusiasts. We understand that each trip is important and that is why we ensure hassle free tours and take responsibility of including the best of everything. Therefore, you can completely trust us with Maharashtra tour packages as we know the state like the back of our hands. Enjoy holiday packages at preferred budget, season and time.','2022-07-27','Tours/images/download_EURvJmU.jfif','Tours/images/Bandhavgarh-2_Z7EXRUA_wdsoGQ3.jpeg','Welcome to Maharashtra','West India');
INSERT INTO "Tours_city" VALUES (3,'Goa','The Ashtavinayak Yatra with Shirdi is the 3 nights / 4 days tour package takes you to the enchanting journey of visiting the religiously significant Sai Baba Temple, followed by the visit to the eight ancient holy temples of Lord Ganesha that are scattered in the nearby beautiful and scenically blessed villages of Pune, all together called Ashtavinayak Yatra. Though, they are all dedicated to one God but the idols adorning each temple are distinctly different, and so as the historical tale behind its existence. But one surprising fact that amazes the tourists is the natural emergence of all the eight temples from within the Mother earth. Starting with Moreshwar (Morgaon), the trip takes you to Siddhivinayak (Siddhatek), Ballaleshwar (Pali), Varad Vinayak (Mahad), Chintamani Vinayak (Theur), Girijatmaj (Lenyadri), Vighneshwar (Ozar), Mahaganapati (Ranjangaon), and then again to Moreshwar (Morgaon), because it is believed that the Yatra completes only after the visit to the first temple again. As far as plannin','2022-07-07','Tours/images/Bandhavgarh-3_MO3q9N5.jpeg','Tours/images/Bandhavgarh-2_HPhVfNz.jpeg','Welcome to goa','Holiday Ideas');
INSERT INTO "Tours_staypackage" VALUES (1,'Hotel 1','This is a hotel','Tours/images/topthings2_uKqGkAu_PdeoEqL.jpeg',1);
INSERT INTO "Tours_staypackage" VALUES (2,'AARAM BAGH','Surrounded by the lush Aravali hills, Aaram Baagh is nestled on Ahmedabad-Udaipur highway. This 3 star hotel depicts the history of mewar royals. The hotel has traditional exteriors and magnificently carved balconies, which add an ideal heritage atmosphere to the place. It is well equipped with indoor and outdoor pools for rejuvenation. There are elegantly designed villas overlooking the magnificent views of the city.','Tours/images/udaipur-aaram-hotels-img1_D6aawLI.jpg',2);
INSERT INTO "Tours_staypackage" VALUES (3,'CAMBAY RESORT','Feel the royal culture and have a luxury stay at Cambay Resort in Udaipur, which is sprawled over an area of 11407 square meters. Featured with Pool & Mountain View, and Executive Suite rooms with beautiful interiors and modern amenities, the interior of this four star hotel is inspired by the city''s unparalleled architectural eminence located against a scenic setting of hills. There are four well equipped on-site banquet halls namely Lords, Viceroy, Lawn and Premiere, where guests can conduct their conference & official meetings, wedding function or social gatherings.','Tours/images/cambay-resort-udaipurr_ZhDqGJO.jpg',2);
INSERT INTO "Tours_staypackage" VALUES (4,'LA CALYPSO HOTEL','La Calypso is a 5 star hotel located on Calangute-Baga Road in Bardez, Goa. Standing still on the sea front, the hotel provides an opportunity to the visitors to witness the beauty of Blue Ocean and take pleasure of various water sports on the beach shore. This hotel is an ideal accommodation option for all those who are seeking for lodging on the tranquil beach of Goa during their vacation and have a lifetime experience.','Tours/images/neelam-the-grand_CtNuuF7.jpg',1);
INSERT INTO "Tours_staypackage" VALUES (5,'THE PARK CALANGUTE','Located on Calangute Beach in North Goa, The Park Calangute is a seafront 5 star resort tastefully designed for all those seeking for luxury comfort and hassle free accommodation services. It is the only resort of such kind in North Goa. This luxurious resort is blessed with all advance facilities to offer a lavish lodging experience to its guests. After exploring the town and its major attractions, guests can relax in an open-air lounge, enjoy fresh air and capture some breathtaking outside views of the blue ocean.','Tours/images/la-calypso-hotel-goa_qoL31hT.jpg',1);
INSERT INTO "Tours_staypackage" VALUES (6,'NEELAM''S THE GRAND','Centrally located near the Calangute Beach, Hotel Neelam The Grand is an amazing lodging option available for the tourists visiting Goa and seeking for eco friendly accommodation near the exotic Calangute Beach of Goa. This resort is also located close to Calangute Market, Baga Beach, St. Alex Church and St. Anthony''s Chapel so that the guests can easily travel to these famous tourists spots and have a wonderful time near the beaches.','Tours/images/cambay-resort-udaipurr_ZhDqGJO_1wFndHv.jpg',1);
INSERT INTO "Tours_staypackage" VALUES (7,'CITRUS GOA','Citrus Goa is a 4 star hotel located at a walking distance from the renowned Calangute Beach of North Goa. Well designed with luxurious furnishings, the hotel is a good lodging place for both leisure travellers as well as business travellers. It share close proximity to major tourist attractions such as Calangute Beach, Baga Beach, Calangute Market, St. Anthony''s Chapel and St. Alex Church. Guests staying in the hotel can any time walk down to the beach to enjoy various water activities. Further, they can visit the nearby tourist spots and shop for their loved one in the local market.','Tours/images/the-park-calangute_F809212.jpg',1);
INSERT INTO "user_profile" VALUES (1,'',0,'2022-07-05 10:33:18.310578','mahima',9826242234,'Female','India',2,'');
INSERT INTO "user_profile" VALUES (2,'',0,'2022-07-05 11:49:37.174755','mitanshu',123456789,'Male','India',5,'');
INSERT INTO "user_profile" VALUES (3,'',0,'2022-07-05 15:06:47.993721','user1',5455785458,'Male','India',6,'');
INSERT INTO "user_profile" VALUES (4,'',0,'2022-07-07 05:56:02.887810','abc',123456789,'','',8,'');
INSERT INTO "user_profile" VALUES (5,'',0,'2022-11-01 08:00:13.349290','Mit',123456789,'','',9,'');
INSERT INTO "Tours_package" VALUES (1,'Bandhavgarh National Park','Tours/images/Bandhavgarh_R6RH9U7.jpeg','Bandhavgarh is a good tourism place.',3,4,5000.0,'Madhya Pradesh','None');
INSERT INTO "Tours_package" VALUES (2,'Beach','Tours/images/Bandhavgarh_qBnvA0O.jpeg','This Package consist of Ranthambore national park vist',3,4,5000.0,'Maharashtra','Goa');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "Tours_topthingstodo_city_id_68f7b833" ON "Tours_topthingstodo" (
	"city_id"
);
CREATE INDEX IF NOT EXISTS "Tours_postimage_post_id_b627d045" ON "Tours_postimage" (
	"post_id"
);
CREATE INDEX IF NOT EXISTS "Tours_day_package_id_041f5692" ON "Tours_day" (
	"package_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "social_auth_nonce_server_url_timestamp_salt_f6284463_uniq" ON "social_auth_nonce" (
	"server_url",
	"timestamp",
	"salt"
);
CREATE UNIQUE INDEX IF NOT EXISTS "social_auth_association_server_url_handle_078befa2_uniq" ON "social_auth_association" (
	"server_url",
	"handle"
);
CREATE UNIQUE INDEX IF NOT EXISTS "social_auth_code_email_code_801b2d02_uniq" ON "social_auth_code" (
	"email",
	"code"
);
CREATE INDEX IF NOT EXISTS "social_auth_code_code_a2393167" ON "social_auth_code" (
	"code"
);
CREATE INDEX IF NOT EXISTS "social_auth_code_timestamp_176b341f" ON "social_auth_code" (
	"timestamp"
);
CREATE INDEX IF NOT EXISTS "social_auth_partial_token_3017fea3" ON "social_auth_partial" (
	"token"
);
CREATE INDEX IF NOT EXISTS "social_auth_partial_timestamp_50f2119f" ON "social_auth_partial" (
	"timestamp"
);
CREATE UNIQUE INDEX IF NOT EXISTS "social_auth_usersocialauth_provider_uid_e6b5e668_uniq" ON "social_auth_usersocialauth" (
	"provider",
	"uid"
);
CREATE INDEX IF NOT EXISTS "social_auth_usersocialauth_user_id_17d28448" ON "social_auth_usersocialauth" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "social_auth_usersocialauth_uid_796e51dc" ON "social_auth_usersocialauth" (
	"uid"
);
CREATE INDEX IF NOT EXISTS "Tours_pessanger_detail_user_id_1f02aa05" ON "Tours_pessanger_detail" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "Tours_qna_city_id_bdd115d4" ON "Tours_qna" (
	"city_id"
);
CREATE INDEX IF NOT EXISTS "Tours_staypackage_place_id_7dbba1aa" ON "Tours_staypackage" (
	"place_id"
);
COMMIT;
