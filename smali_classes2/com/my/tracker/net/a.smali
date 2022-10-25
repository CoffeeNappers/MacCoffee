.class public final Lcom/my/tracker/net/a;
.super Ljava/lang/Object;
.source "Hosts.java"


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "https://tracker-api.my.com/v2/"

    sput-object v0, Lcom/my/tracker/net/a;->a:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/my/tracker/net/a;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 27
    sget-object v0, Lcom/my/tracker/net/a;->b:Ljava/lang/String;

    .line 29
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/my/tracker/net/a;->a:Ljava/lang/String;

    goto :goto_0
.end method
