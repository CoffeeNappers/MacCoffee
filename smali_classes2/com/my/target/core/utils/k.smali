.class public Lcom/my/target/core/utils/k;
.super Ljava/lang/Object;
.source "PreferencesManager.java"


# static fields
.field private static a:Lcom/my/target/core/utils/k;

.field private static b:Z


# instance fields
.field private c:Landroid/content/Context;

.field private d:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public static a()Lcom/my/target/core/utils/k;
    .locals 2

    .prologue
    .line 24
    const-class v1, Lcom/my/target/core/utils/k;

    monitor-enter v1

    .line 26
    :try_start_0
    sget-object v0, Lcom/my/target/core/utils/k;->a:Lcom/my/target/core/utils/k;

    if-nez v0, :cond_0

    .line 27
    new-instance v0, Lcom/my/target/core/utils/k;

    invoke-direct {v0}, Lcom/my/target/core/utils/k;-><init>()V

    sput-object v0, Lcom/my/target/core/utils/k;->a:Lcom/my/target/core/utils/k;

    .line 28
    :cond_0
    sget-object v0, Lcom/my/target/core/utils/k;->a:Lcom/my/target/core/utils/k;

    monitor-exit v1

    return-object v0

    .line 29
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/my/target/core/utils/k;->d:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 113
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 114
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    monitor-exit p0

    return-void

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Lcom/my/target/core/utils/k;
    .locals 2

    .prologue
    .line 34
    sget-boolean v0, Lcom/my/target/core/utils/k;->b:Z

    if-nez v0, :cond_0

    .line 36
    iput-object p1, p0, Lcom/my/target/core/utils/k;->c:Landroid/content/Context;

    .line 37
    const-string/jumbo v0, "mytarget_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/utils/k;->d:Landroid/content/SharedPreferences;

    .line 38
    const/4 v0, 0x1

    sput-boolean v0, Lcom/my/target/core/utils/k;->b:Z

    .line 41
    :cond_0
    return-object p0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 101
    const-string/jumbo v0, "mrgsDeviceId"

    invoke-direct {p0, v0, p1}, Lcom/my/target/core/utils/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public final b()Ljava/lang/String;
    .locals 3

    .prologue
    .line 96
    const-string/jumbo v0, "mrgsDeviceId"

    .line 1107
    iget-object v1, p0, Lcom/my/target/core/utils/k;->d:Landroid/content/SharedPreferences;

    const-string/jumbo v2, ""

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 96
    return-object v0
.end method
