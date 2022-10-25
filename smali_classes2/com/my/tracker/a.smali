.class public final Lcom/my/tracker/a;
.super Ljava/lang/Object;
.source "Tracer.java"


# static fields
.field static volatile a:Z

.field static volatile b:Lcom/my/tracker/LogHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-boolean v0, Lcom/my/tracker/a;->a:Z

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 29
    sget-boolean v0, Lcom/my/tracker/a;->a:Z

    if-eqz v0, :cond_0

    .line 31
    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz p0, :cond_1

    :goto_0
    invoke-interface {v0, p0}, Lcom/my/tracker/LogHandler;->d(Ljava/lang/String;)V

    .line 34
    :cond_0
    :goto_1
    return-void

    .line 31
    :cond_1
    const-string/jumbo p0, "null"

    goto :goto_0

    .line 32
    :cond_2
    const-string/jumbo v0, "[myTracker]"

    if-eqz p0, :cond_3

    :goto_2
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    const-string/jumbo p0, "null"

    goto :goto_2
.end method

.method public static a(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 53
    sget-boolean v0, Lcom/my/tracker/a;->a:Z

    if-eqz v0, :cond_0

    .line 55
    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz p0, :cond_1

    :goto_0
    invoke-interface {v0, p0, p1}, Lcom/my/tracker/LogHandler;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    :cond_0
    :goto_1
    return-void

    .line 55
    :cond_1
    const-string/jumbo p0, "null"

    goto :goto_0

    .line 56
    :cond_2
    const-string/jumbo v0, "[myTracker]"

    if-eqz p0, :cond_3

    :goto_2
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :cond_3
    const-string/jumbo p0, "null"

    goto :goto_2
.end method

.method public static b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz p0, :cond_0

    :goto_0
    invoke-interface {v0, p0}, Lcom/my/tracker/LogHandler;->i(Ljava/lang/String;)V

    .line 40
    :goto_1
    return-void

    .line 38
    :cond_0
    const-string/jumbo p0, "null"

    goto :goto_0

    .line 39
    :cond_1
    const-string/jumbo v0, "[myTracker]"

    if-eqz p0, :cond_2

    :goto_2
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    const-string/jumbo p0, "null"

    goto :goto_2
.end method

.method public static c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 44
    sget-boolean v0, Lcom/my/tracker/a;->a:Z

    if-eqz v0, :cond_0

    .line 46
    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/my/tracker/a;->b:Lcom/my/tracker/LogHandler;

    if-eqz p0, :cond_1

    :goto_0
    invoke-interface {v0, p0}, Lcom/my/tracker/LogHandler;->e(Ljava/lang/String;)V

    .line 49
    :cond_0
    :goto_1
    return-void

    .line 46
    :cond_1
    const-string/jumbo p0, "null"

    goto :goto_0

    .line 47
    :cond_2
    const-string/jumbo v0, "[myTracker]"

    if-eqz p0, :cond_3

    :goto_2
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    const-string/jumbo p0, "null"

    goto :goto_2
.end method
