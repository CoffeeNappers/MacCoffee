.class public final Lcom/google/android/youtube/player/YouTubeIntents;
.super Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;
    .locals 3

    const-string/jumbo v0, "app_package"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "app_version"

    invoke-static {p1}, Lcom/google/android/youtube/player/internal/z;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "client_library_version"

    invoke-static {}, Lcom/google/android/youtube/player/internal/z;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
.end method

.method private static a(Ljava/lang/String;)Landroid/net/Uri;
    .locals 3

    const-string/jumbo v0, "https://www.youtube.com/playlist?list="

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/youtube/player/internal/z;->b(Landroid/content/pm/PackageManager;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "com.google.android.youtube.tv"

    :goto_0
    return-object v0

    :cond_0
    invoke-static {v0}, Lcom/google/android/youtube/player/internal/z;->a(Landroid/content/pm/PackageManager;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "com.google.android.youtube.googletv"

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "com.google.android.youtube"

    goto :goto_0
.end method

.method private static a(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/high16 v1, 0x10000

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static a(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method private static b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static canResolveChannelIntent(Landroid/content/Context;)Z
    .locals 1

    const-string/jumbo v0, "https://www.youtube.com/channel/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public static canResolveOpenPlaylistIntent(Landroid/content/Context;)Z
    .locals 1

    const-string/jumbo v0, "https://www.youtube.com/playlist?list="

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public static canResolvePlayPlaylistIntent(Landroid/content/Context;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->getInstalledYouTubeVersionCode(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/youtube/player/internal/z;->a(Landroid/content/pm/PackageManager;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x125c

    if-lt v2, v3, :cond_0

    move v2, v0

    :goto_0
    if-eqz v2, :cond_3

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->canResolveOpenPlaylistIntent(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    :goto_1
    return v0

    :cond_0
    move v2, v1

    goto :goto_0

    :cond_1
    const/16 v3, 0xfa0

    if-lt v2, v3, :cond_2

    move v2, v0

    goto :goto_0

    :cond_2
    move v2, v1

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method public static canResolvePlayVideoIntent(Landroid/content/Context;)Z
    .locals 1

    const-string/jumbo v0, "https://www.youtube.com/watch?v="

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public static canResolvePlayVideoIntentWithOptions(Landroid/content/Context;)Z
    .locals 5

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->getInstalledYouTubeVersionCode(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/youtube/player/internal/z;->b(Landroid/content/pm/PackageManager;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v0

    :goto_0
    if-eqz v2, :cond_4

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->canResolvePlayVideoIntent(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4

    :goto_1
    return v0

    :cond_0
    invoke-static {v3}, Lcom/google/android/youtube/player/internal/z;->a(Landroid/content/pm/PackageManager;)Z

    move-result v3

    if-eqz v3, :cond_2

    const v3, 0x7fffffff

    if-lt v2, v3, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    move v2, v1

    goto :goto_0

    :cond_2
    const/16 v3, 0xce4

    if-lt v2, v3, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_1
.end method

.method public static canResolveSearchIntent(Landroid/content/Context;)Z
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/youtube/player/internal/z;->a(Landroid/content/pm/PackageManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->getInstalledYouTubeVersionCode(Landroid/content/Context;)I

    move-result v0

    const/16 v1, 0x125c

    if-ge v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.SEARCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    goto :goto_0
.end method

.method public static canResolveUploadIntent(Landroid/content/Context;)Z
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.google.android.youtube.intent.action.UPLOAD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "video/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static canResolveUserIntent(Landroid/content/Context;)Z
    .locals 1

    const-string/jumbo v0, "https://www.youtube.com/user/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method public static createChannelIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    const-string/jumbo v0, "https://www.youtube.com/channel/"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static createOpenPlaylistIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    invoke-static {p1}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createPlayPlaylistIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    invoke-static {p1}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string/jumbo v1, "playnext"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createPlayVideoIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->createPlayVideoIntentWithOptions(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createPlayVideoIntentWithOptions(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;
    .locals 3

    const-string/jumbo v0, "https://www.youtube.com/watch?v="

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "force_fullscreen"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "finish_on_ended"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static createSearchIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.SEARCH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "query"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createUploadIntent(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "videoUri parameter cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "content://media/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "videoUri parameter must be a URI pointing to a valid video file. It must begin with \"content://media/\""

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.google.android.youtube.intent.action.UPLOAD"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "video/*"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Intent;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static createUserIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    const-string/jumbo v0, "https://www.youtube.com/user/"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/youtube/player/YouTubeIntents;->b(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getInstalledYouTubeVersionCode(Landroid/content/Context;)I
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getInstalledYouTubeVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isYouTubeInstalled(Landroid/content/Context;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-static {p0}, Lcom/google/android/youtube/player/YouTubeIntents;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method
