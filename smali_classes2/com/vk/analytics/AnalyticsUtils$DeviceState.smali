.class public Lcom/vk/analytics/AnalyticsUtils$DeviceState;
.super Ljava/lang/Object;
.source "AnalyticsUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeviceState"
.end annotation


# instance fields
.field public final mFreeMemory:Ljava/lang/Long;

.field public final mNetworkAccess:Ljava/lang/String;

.field public final mOrientation:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-static {}, Lcom/vk/analytics/AnalyticsUtils;->access$000()Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsUtils$DeviceState;->mFreeMemory:Ljava/lang/Long;

    .line 24
    invoke-static {p1}, Lcom/vk/analytics/AnalyticsUtils;->access$100(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsUtils$DeviceState;->mOrientation:Ljava/lang/String;

    .line 25
    invoke-static {p1}, Lcom/vk/analytics/AnalyticsUtils;->access$200(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsUtils$DeviceState;->mNetworkAccess:Ljava/lang/String;

    .line 26
    return-void
.end method
