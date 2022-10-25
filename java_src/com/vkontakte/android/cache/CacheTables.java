package com.vkontakte.android.cache;

import android.database.sqlite.SQLiteDatabase;
/* loaded from: classes2.dex */
public class CacheTables {
    public static final int GROUPS_DB_VERSION = 10;
    public static final int MAIN_DB_VERSION = 107;
    public static final int POSTS_DB_VERSION = 27;

    public static void createPosts(SQLiteDatabase db) {
        db.execSQL("DROP TABLE IF EXISTS `news`");
        db.execSQL("DROP TABLE IF EXISTS `news_comments`");
        db.execSQL("DROP TABLE IF EXISTS `wall`");
        db.execSQL("DROP TABLE IF EXISTS `feed_lists`");
        db.execSQL("CREATE TABLE `news` (pid int, uid int, text text, time int, likes int, comments int, username varchar(150), userphoto varchar(200), retweet_uid int, retweet_username varchar(150), attachments blob, flags int, retweet_text text, retweet_user_photo varchar(150), retweet_orig_id int, retweet_orig_time int, retweets int, viewers int, retweet_type int, created_by int not null, platform int not null, extra string, order_position int, activity blob)");
        db.execSQL("CREATE TABLE `feed_lists` (lid int, pid varchar(100), promo bool, title varchat(500))");
    }

    public static void createAudio(SQLiteDatabase db) {
        db.execSQL("DROP TABLE IF EXISTS `files`");
        db.execSQL("CREATE TABLE `files` (oid int, aid int, title varchar(500), artist varchar(500), duration int, lastplay int, user bool, lyrics_id int, cover_version int not null default 0, lyrics text, file_size int not null default -1)");
    }

    public static void createGroups(SQLiteDatabase db) {
        db.execSQL("DROP TABLE IF EXISTS `groups`");
        db.execSQL("CREATE TABLE `groups` (id int, title text, photo varchar(500), domain varchar(500), activity varchar(500), type int, event_time int, closed int, admin bool, admin_level int, members_count int, verified int)");
    }

    public static void createCache(SQLiteDatabase db) {
        db.execSQL("DROP TABLE IF EXISTS `users`");
        db.execSQL("DROP TABLE IF EXISTS `birthdays`");
        db.execSQL("DROP TABLE IF EXISTS `friendlists`");
        db.execSQL("DROP TABLE IF EXISTS `users_friendlists`");
        db.execSQL("DROP TABLE IF EXISTS `messages`");
        db.execSQL("DROP TABLE IF EXISTS `chats`");
        db.execSQL("DROP TABLE IF EXISTS `chats_users`");
        db.execSQL("DROP VIEW IF EXISTS `dialogs`");
        db.execSQL("DROP TABLE IF EXISTS `groups`");
        db.execSQL("DROP TABLE IF EXISTS `news`");
        db.execSQL("DROP TABLE IF EXISTS `news_comments`");
        db.execSQL("DROP TABLE IF EXISTS `wall`");
        db.execSQL("DROP TABLE IF EXISTS `wall_drafts`");
        db.execSQL("DROP TABLE IF EXISTS `api_queue`");
        db.execSQL("DROP TABLE IF EXISTS `friends_hints_order`");
        db.execSQL("DROP TABLE IF EXISTS `imported_contacts`");
        db.execSQL("DROP TABLE IF EXISTS `users_name_cases`");
        db.execSQL("DROP TABLE IF EXISTS `messages_read_ids_in`");
        db.execSQL("DROP TABLE IF EXISTS `messages_read_ids_out`");
        db.execSQL("DROP TABLE IF EXISTS `messages_unread_counters`");
        db.execSQL("DROP TABLE IF EXISTS `messages_top_ids`");
        db.execSQL("DROP INDEX IF EXISTS `messages_mid`");
        db.execSQL("DROP INDEX IF EXISTS `messages_time`");
        db.execSQL("DROP INDEX IF EXISTS `messages_peer`");
        db.execSQL("DROP INDEX IF EXISTS `messages_peer_mid`");
        db.execSQL("DROP INDEX IF EXISTS `messages_top_ids_time`");
        db.execSQL("DROP INDEX IF EXISTS `messages_top_ids_id`");
        db.execSQL("DROP INDEX IF EXISTS `chats_users_cid`");
        db.execSQL("DROP INDEX IF EXISTS `imported_contacts_service`");
        db.execSQL("DROP INDEX IF EXISTS `users_cases`");
        db.execSQL("CREATE TABLE `users` (uid int not null unique, firstname varchar(150), lastname varchar(150), photo_small varchar(200), photo_big varchar(200), domain varchar(200), is_friend bool, f bool, last_updated int, lists int, bday int default -1, bmonth int default -1, byear int default -1, name_r varchar(150))");
        db.execSQL("CREATE TABLE `users_name_cases` (uid int not null, firstname varchar(150), lastname varchar(150), name_case int not null)");
        db.execSQL("CREATE INDEX `users_cases` ON users_name_cases (name_case)");
        db.execSQL("CREATE TABLE `friendlists` (lid int unique, name varchar(200))");
        db.execSQL("CREATE TABLE `users_friendlists` (uid int not null, lid int not null)");
        db.execSQL("CREATE TABLE `friends_hints_order` (uid int not null, list_order int not null)");
        db.execSQL("CREATE TABLE `imported_contacts` (vk_id int not null, external_id varchar(30), external_name varchar(150), external_photo varchar(200), description varchar(300), req_sent bool, service int not null, unique(vk_id, external_id) on conflict replace)");
        db.execSQL("CREATE TABLE `messages` (mid int unique, peer int not null, sender int not null, text text, time int not null, attachments blob, fwd blob, extras text, flags int not null, random_id int)");
        db.execSQL("CREATE TABLE `chats` (cid int unique, title varchar(500), admin int not null, photo varchar(500), need_update_users bool not null default 1)");
        db.execSQL("CREATE TABLE `chats_users` (cid int not null, uid int not null, inviter int not null, invited int not null)");
        db.execSQL("CREATE TABLE `messages_read_ids_in` (peer int unique, mid int not null)");
        db.execSQL("CREATE TABLE `messages_read_ids_out` (peer int unique, mid int not null)");
        db.execSQL("CREATE TABLE `messages_unread_counters` (peer int unique, unread_count int not null default 0)");
        db.execSQL("CREATE TABLE `messages_top_ids` (peer int unique, msg_id int not null, msg_time int not null)");
        db.execSQL("CREATE VIEW `dialogs` AS SELECT messages.*, users.*, chats.*, messages_unread_counters.unread_count, messages_top_ids.msg_time FROM messages_top_ids JOIN messages ON messages_top_ids.msg_id=messages.mid LEFT JOIN users ON messages.peer=uid LEFT JOIN chats ON messages.peer-2000000000=cid LEFT JOIN messages_unread_counters ON messages.peer=messages_unread_counters.peer");
        db.execSQL("CREATE INDEX `messages_mid` ON messages (mid)");
        db.execSQL("CREATE INDEX `messages_time` ON messages (time)");
        db.execSQL("CREATE INDEX `messages_peer` ON messages (peer)");
        db.execSQL("CREATE INDEX `messages_peer_mid` ON messages (peer, mid)");
        db.execSQL("CREATE INDEX `messages_top_ids_time` ON messages_top_ids (msg_time)");
        db.execSQL("CREATE INDEX `messages_top_ids_id` ON messages_top_ids (msg_id)");
        db.execSQL("CREATE INDEX `chats_users_cid` ON chats_users (cid)");
        db.execSQL("CREATE INDEX `imported_contacts_service` ON imported_contacts (service)");
        db.execSQL("CREATE TABLE `groups` (gid int not null unique, name varchar(200), activity varchar(200), domain varchar(200), count int not null, type int not null, closed int not null)");
        db.execSQL("CREATE TABLE `api_queue` (id INTEGER PRIMARY KEY, method varchar(200), args text, success_callback varchar(1024), user_data text)");
    }
}
