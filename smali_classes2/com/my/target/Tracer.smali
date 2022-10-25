.class public Lcom/my/target/Tracer;
.super Ljava/lang/Object;
.source "Tracer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "[myTarget]"

.field public static enabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-boolean v0, Lcom/my/target/Tracer;->enabled:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 28
    sget-boolean v0, Lcom/my/target/Tracer;->enabled:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "[myTarget]"

    if-eqz p0, :cond_1

    :goto_0
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    :cond_0
    return-void

    .line 28
    :cond_1
    const-string/jumbo p0, "null"

    goto :goto_0
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 33
    sget-boolean v0, Lcom/my/target/Tracer;->enabled:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "[myTarget]"

    if-eqz p0, :cond_1

    :goto_0
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    :cond_0
    return-void

    .line 33
    :cond_1
    const-string/jumbo p0, "null"

    goto :goto_0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 38
    const-string/jumbo v0, "[myTarget]"

    if-eqz p0, :cond_0

    :goto_0
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    return-void

    .line 38
    :cond_0
    const-string/jumbo p0, "null"

    goto :goto_0
.end method
