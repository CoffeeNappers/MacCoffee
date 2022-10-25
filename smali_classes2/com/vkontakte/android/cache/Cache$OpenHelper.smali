.class Lcom/vkontakte/android/cache/Cache$OpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/cache/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OpenHelper"
.end annotation


# static fields
.field private static volatile instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const-string/jumbo v0, "vk.db"

    const/4 v1, 0x0

    const/16 v2, 0x6b

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 92
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/cache/Cache$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/vkontakte/android/cache/Cache$1;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/vkontakte/android/cache/Cache$OpenHelper;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static clear()V
    .locals 4

    .prologue
    .line 75
    const-class v2, Lcom/vkontakte/android/cache/Cache$OpenHelper;

    monitor-enter v2

    .line 76
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 78
    :try_start_1
    sget-object v1, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    invoke-virtual {v1}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    const/4 v1, 0x0

    :try_start_2
    sput-object v1, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    .line 85
    :cond_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "vk.db"

    invoke-virtual {v1, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 86
    monitor-exit v2

    .line 87
    return-void

    .line 79
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 80
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 86
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/vkontakte/android/cache/Cache$OpenHelper;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 64
    sget-object v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    if-nez v0, :cond_1

    .line 65
    const-class v1, Lcom/vkontakte/android/cache/Cache$OpenHelper;

    monitor-enter v1

    .line 66
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    if-nez v0, :cond_0

    .line 67
    new-instance v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/vkontakte/android/cache/Cache$OpenHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    .line 69
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :cond_1
    sget-object v0, Lcom/vkontakte/android/cache/Cache$OpenHelper;->instance:Lcom/vkontakte/android/cache/Cache$OpenHelper;

    return-object v0

    .line 69
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 96
    invoke-static {p1}, Lcom/vkontakte/android/cache/CacheTables;->createCache(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 97
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 101
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/cache/Cache$OpenHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 102
    return-void
.end method
