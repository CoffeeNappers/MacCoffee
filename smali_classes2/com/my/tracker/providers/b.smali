.class public final Lcom/my/tracker/providers/b;
.super Lcom/my/tracker/providers/a;
.source "AppsDataProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/tracker/providers/b$a;
    }
.end annotation


# instance fields
.field private a:Z

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/tracker/providers/b$a;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/String;

.field private d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/my/tracker/providers/a;-><init>()V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/providers/b;->a:Z

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/tracker/providers/b;->d:Z

    .line 61
    return-void
.end method

.method private static c(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/tracker/providers/b$a;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    const/4 v0, 0x0

    .line 136
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 137
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 143
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 144
    if-eqz v0, :cond_1

    .line 145
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .line 147
    iget-object v6, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 148
    iget v1, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    .line 151
    const-wide/16 v2, 0x0

    .line 152
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x8

    if-le v1, v7, :cond_2

    iget-wide v0, v0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    .line 153
    :goto_2
    new-instance v2, Lcom/my/tracker/providers/b$a;

    iget-object v3, v6, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-direct {v2, v3, v0, v1}, Lcom/my/tracker/providers/b$a;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 140
    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 155
    :cond_1
    return-object v4

    :cond_2
    move-wide v0, v2

    goto :goto_2
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/my/tracker/providers/a;->a(Landroid/content/Context;)V

    .line 116
    iget-boolean v0, p0, Lcom/my/tracker/providers/b;->d:Z

    if-eqz v0, :cond_0

    .line 121
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;

    move-result-object v0

    .line 122
    iget-object v1, p0, Lcom/my/tracker/providers/b;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/my/tracker/utils/e;->d(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/tracker/providers/b;->d:Z

    .line 129
    :cond_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PreferencesManager error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a(Lcom/my/tracker/builders/a;)V
    .locals 1

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/my/tracker/providers/b;->d:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/providers/b;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/my/tracker/builders/a;->b(Ljava/util/List;)V

    .line 110
    :cond_0
    return-void
.end method

.method public final a(Z)V
    .locals 0

    .prologue
    .line 53
    iput-boolean p1, p0, Lcom/my/tracker/providers/b;->a:Z

    .line 54
    return-void
.end method

.method public final b(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 68
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 70
    const-string/jumbo v0, "AppsDataProvider: You must not call collectData method from main thread"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 105
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iget-boolean v0, p0, Lcom/my/tracker/providers/b;->a:Z

    if-eqz v0, :cond_0

    .line 79
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 86
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/my/tracker/providers/b;->d:Z

    .line 87
    invoke-static {p1}, Lcom/my/tracker/providers/b;->c(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/b;->b:Ljava/util/ArrayList;

    .line 89
    iget-object v1, p0, Lcom/my/tracker/providers/b;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/my/tracker/utils/c;->a(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    .line 91
    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 93
    invoke-virtual {v0}, Lcom/my/tracker/utils/e;->c()Ljava/lang/String;

    move-result-object v0

    .line 94
    invoke-static {v1}, Lcom/my/tracker/utils/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/my/tracker/providers/b;->c:Ljava/lang/String;

    .line 95
    iget-object v1, p0, Lcom/my/tracker/providers/b;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 97
    const-string/jumbo v0, "Apps hash did not changed"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 80
    :catch_0
    move-exception v0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PreferencesManager error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 101
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/tracker/providers/b;->d:Z

    .line 102
    const-string/jumbo v0, "Apps hash changed"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method
