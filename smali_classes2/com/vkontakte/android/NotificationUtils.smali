.class public Lcom/vkontakte/android/NotificationUtils;
.super Ljava/lang/Object;
.source "NotificationUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/NotificationUtils$Type;
    }
.end annotation


# static fields
.field private static isFlyme:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/system/framework/flyme-framework.jar"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    sput-boolean v0, Lcom/vkontakte/android/NotificationUtils;->isFlyme:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ntf"    # Landroid/app/Notification;
    .param p2, "type"    # Lcom/vkontakte/android/NotificationUtils$Type;
    .param p3, "isAlert"    # Z

    .prologue
    const/16 v10, 0x3e8

    const/16 v9, 0x15

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 125
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 126
    .local v3, "prefs":Landroid/content/SharedPreferences;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_0

    .line 127
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0f0018

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    iput v5, p1, Landroid/app/Notification;->color:I

    .line 129
    :cond_0
    sget-boolean v5, Lcom/vkontakte/android/NotificationUtils;->isFlyme:Z

    if-eqz v5, :cond_1

    .line 131
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string/jumbo v6, "mFlymeNotification"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 132
    .local v1, "fld":Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 133
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 135
    .local v0, "ext":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string/jumbo v6, "internalApp"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 136
    .local v2, "internalApp":Ljava/lang/reflect/Field;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 137
    const/4 v5, 0x1

    invoke-virtual {v2, v0, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    .end local v0    # "ext":Ljava/lang/Object;
    .end local v1    # "fld":Ljava/lang/reflect/Field;
    .end local v2    # "internalApp":Ljava/lang/reflect/Field;
    :cond_1
    :goto_0
    if-nez p3, :cond_3

    .line 164
    :cond_2
    :goto_1
    return-void

    .line 138
    :catch_0
    move-exception v4

    .line 139
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 145
    .end local v4    # "x":Ljava/lang/Exception;
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyAdvanced"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Lcom/vkontakte/android/NotificationUtils$Type;->access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-static {p2}, Lcom/vkontakte/android/NotificationUtils$Type;->access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "ext":Ljava/lang/String;
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyRingtone"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_4

    .line 147
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyRingtone"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, p1, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 149
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyVibrate"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 150
    iget v5, p1, Landroid/app/Notification;->defaults:I

    or-int/lit8 v5, v5, 0x2

    iput v5, p1, Landroid/app/Notification;->defaults:I

    .line 152
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyLED"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 153
    iget v5, p1, Landroid/app/Notification;->flags:I

    or-int/lit8 v5, v5, 0x1

    iput v5, p1, Landroid/app/Notification;->flags:I

    .line 154
    const-string/jumbo v5, "notifyLedColor"

    const/4 v6, -0x1

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p1, Landroid/app/Notification;->ledARGB:I

    .line 155
    iput v10, p1, Landroid/app/Notification;->ledOnMS:I

    .line 156
    iput v10, p1, Landroid/app/Notification;->ledOffMS:I

    .line 158
    :cond_6
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_2

    .line 159
    const-string/jumbo v5, "social"

    iput-object v5, p1, Landroid/app/Notification;->category:Ljava/lang/String;

    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "notifyHeadsUp"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 161
    const/4 v5, 0x2

    iput v5, p1, Landroid/app/Notification;->priority:I

    goto/16 :goto_1

    .line 145
    .end local v0    # "ext":Ljava/lang/String;
    :cond_7
    const-string/jumbo v0, ""

    goto/16 :goto_2
.end method

.method public static areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Lcom/vkontakte/android/NotificationUtils$Type;

    .prologue
    .line 111
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 112
    .local v0, "prefs":Landroid/content/SharedPreferences;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "notifications"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/vkontakte/android/NotificationUtils$Type;->access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static arePeerNotificationsEnabled(Landroid/content/Context;I)Z
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "peer"    # I

    .prologue
    const/4 v1, 0x0

    .line 116
    const-string/jumbo v2, "notify"

    invoke-virtual {p0, v2, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 117
    .local v0, "nprefs":Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "dnd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v3, v4

    if-le v2, v3, :cond_1

    .line 121
    :cond_0
    :goto_0
    return v1

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "mute"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static getNotificationSettings(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 173
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 177
    .local v0, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string/jumbo v1, "sdk_open"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 178
    const-string/jumbo v1, "new_post"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    const-string/jumbo v1, "friend_accepted"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    const-string/jumbo v1, "wall_publish"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    const-string/jumbo v1, "group_accepted"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    const-string/jumbo v1, "money_transfer"

    const-string/jumbo v2, "on"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    const-string/jumbo v2, "msg"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->PrivateMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "on"

    :goto_0
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    const-string/jumbo v2, "chat"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->ChatMessages:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "on"

    :goto_1
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    const-string/jumbo v2, "friend"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->FriendRequests:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "on"

    :goto_2
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    const-string/jumbo v2, "friend_found"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->FoundFriends:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, "on"

    :goto_3
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    const-string/jumbo v2, "reply"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Replies:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "on"

    :goto_4
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 190
    const-string/jumbo v2, "comment"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Comments:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v1, "on"

    :goto_5
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 191
    const-string/jumbo v2, "mention"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Mentions:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string/jumbo v1, "on"

    :goto_6
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 192
    const-string/jumbo v2, "like"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Likes:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string/jumbo v1, "on"

    :goto_7
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 193
    const-string/jumbo v2, "repost"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Reposts:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_8

    const-string/jumbo v1, "on"

    :goto_8
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    const-string/jumbo v2, "wall_post"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Posts:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string/jumbo v1, "on"

    :goto_9
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 195
    const-string/jumbo v2, "group_invite"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->GroupInvites:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string/jumbo v1, "on"

    :goto_a
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    const-string/jumbo v2, "event_soon"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->UpcomingEvents:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_b

    const-string/jumbo v1, "on"

    :goto_b
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    const-string/jumbo v2, "tag_photo"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->PhotoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_c

    const-string/jumbo v1, "on"

    :goto_c
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    const-string/jumbo v2, "tag_video"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->VideoTags:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string/jumbo v1, "on"

    :goto_d
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    const-string/jumbo v2, "app_request"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Games:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_e

    const-string/jumbo v1, "on"

    :goto_e
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    const-string/jumbo v2, "gift"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->Gifts:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_f

    const-string/jumbo v1, "on"

    :goto_f
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 201
    const-string/jumbo v2, "birthday"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->BDays:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_10

    const-string/jumbo v1, "on"

    :goto_10
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    const-string/jumbo v2, "live"

    sget-object v1, Lcom/vkontakte/android/NotificationUtils$Type;->LiveBroadcasts:Lcom/vkontakte/android/NotificationUtils$Type;

    invoke-static {p0, v1}, Lcom/vkontakte/android/NotificationUtils;->areNotificationsEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z

    move-result v1

    if-eqz v1, :cond_11

    const-string/jumbo v1, "on"

    :goto_11
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    :goto_12
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 185
    :cond_0
    :try_start_1
    const-string/jumbo v1, "off"

    goto/16 :goto_0

    .line 186
    :cond_1
    const-string/jumbo v1, "off"

    goto/16 :goto_1

    .line 187
    :cond_2
    const-string/jumbo v1, "off"

    goto/16 :goto_2

    .line 188
    :cond_3
    const-string/jumbo v1, "off"

    goto/16 :goto_3

    .line 189
    :cond_4
    const-string/jumbo v1, "off"

    goto/16 :goto_4

    .line 190
    :cond_5
    const-string/jumbo v1, "off"

    goto/16 :goto_5

    .line 191
    :cond_6
    const-string/jumbo v1, "off"

    goto/16 :goto_6

    .line 192
    :cond_7
    const-string/jumbo v1, "off"

    goto/16 :goto_7

    .line 193
    :cond_8
    const-string/jumbo v1, "off"

    goto/16 :goto_8

    .line 194
    :cond_9
    const-string/jumbo v1, "off"

    goto/16 :goto_9

    .line 195
    :cond_a
    const-string/jumbo v1, "off"

    goto/16 :goto_a

    .line 196
    :cond_b
    const-string/jumbo v1, "off"

    goto/16 :goto_b

    .line 197
    :cond_c
    const-string/jumbo v1, "off"

    goto/16 :goto_c

    .line 198
    :cond_d
    const-string/jumbo v1, "off"

    goto/16 :goto_d

    .line 199
    :cond_e
    const-string/jumbo v1, "off"

    goto/16 :goto_e

    .line 200
    :cond_f
    const-string/jumbo v1, "off"

    goto :goto_f

    .line 201
    :cond_10
    const-string/jumbo v1, "off"

    goto :goto_10

    .line 202
    :cond_11
    const-string/jumbo v1, "off"
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_11

    .line 204
    :catch_0
    move-exception v1

    goto :goto_12
.end method

.method public static isSoundEnabled(Landroid/content/Context;Lcom/vkontakte/android/NotificationUtils$Type;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # Lcom/vkontakte/android/NotificationUtils$Type;

    .prologue
    const/4 v2, 0x0

    .line 167
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 168
    .local v1, "prefs":Landroid/content/SharedPreferences;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "notifyAdvanced"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lcom/vkontakte/android/NotificationUtils$Type;->access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {p1}, Lcom/vkontakte/android/NotificationUtils$Type;->access$000(Lcom/vkontakte/android/NotificationUtils$Type;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, "ext":Ljava/lang/String;
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "notifyRingtone"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Landroid/provider/Settings$System;->DEFAULT_NOTIFICATION_URI:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2

    .line 168
    .end local v0    # "ext":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static setEnableDialogNotification(Landroid/content/Context;IZ)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "id"    # I
    .param p2, "enable"    # Z

    .prologue
    const v3, 0x7fffffff

    const/4 v5, 0x0

    const/4 v2, 0x0

    .line 100
    const-string/jumbo v1, "notify"

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 101
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "dnd"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-eqz p2, :cond_0

    move v1, v2

    :goto_0
    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "mute"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-nez p2, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 103
    if-eqz p2, :cond_2

    .line 104
    new-instance v1, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;

    invoke-direct {v1, p1, v2, v2}, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;-><init>(IIZ)V

    invoke-virtual {v1, v5, v5}, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 108
    :goto_2
    return-void

    :cond_0
    move v1, v3

    .line 101
    goto :goto_0

    :cond_1
    move v1, v2

    .line 102
    goto :goto_1

    .line 106
    :cond_2
    new-instance v1, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;

    invoke-direct {v1, p1, v3}, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;-><init>(II)V

    invoke-virtual {v1, v5, v5}, Lcom/vkontakte/android/api/account/AccountSetSilenceMode;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_2
.end method

.method public static syncNotificationSettings(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/orm/ConversationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "conversationsInfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/orm/ConversationInfo;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 69
    .local v0, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_0

    .line 70
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/orm/ConversationInfo;

    .line 71
    .local v1, "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    iget v6, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->peer_id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 74
    .end local v1    # "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    :cond_0
    const-string/jumbo v5, "notify"

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 75
    .local v4, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v3

    .line 76
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 77
    .local v2, "key":Ljava/lang/String;
    const-string/jumbo v6, "dnd[0-9]+"

    invoke-virtual {v2, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 78
    const/4 v6, 0x3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 79
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_1

    .line 81
    :cond_2
    const-string/jumbo v6, "mute[0-9]+"

    invoke-virtual {v2, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 82
    const/4 v6, 0x4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 83
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_1

    .line 88
    .end local v2    # "key":Ljava/lang/String;
    :cond_3
    if-eqz p1, :cond_5

    .line 89
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/orm/ConversationInfo;

    .line 90
    .restart local v1    # "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "dnd"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->peer_id:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget v5, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->disabled_until:I

    if-ltz v5, :cond_4

    iget v5, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->disabled_until:I

    .line 91
    :goto_3
    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "mute"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->peer_id:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-boolean v8, v1, Lcom/vkontakte/android/data/orm/ConversationInfo;->mute:Z

    .line 92
    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 93
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_2

    .line 90
    :cond_4
    const v5, 0x7fffffff

    goto :goto_3

    .line 96
    .end local v1    # "info":Lcom/vkontakte/android/data/orm/ConversationInfo;
    :cond_5
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v6, Landroid/content/Intent;

    const-string/jumbo v7, "com.vkontakte.android.MUTE_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 97
    return-void
.end method
