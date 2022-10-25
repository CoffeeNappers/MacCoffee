.class Lcom/vkontakte/android/statistics/StatisticBase$1;
.super Ljava/lang/Object;
.source "StatisticBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/statistics/StatisticBase;->sendAsync(Lcom/vkontakte/android/statistics/StatisticSender;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private failCount:I

.field final synthetic this$0:Lcom/vkontakte/android/statistics/StatisticBase;

.field final synthetic val$retryCount:I

.field final synthetic val$retryTime:J

.field final synthetic val$sender:Lcom/vkontakte/android/statistics/StatisticSender;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;IJ)V
    .locals 2
    .param p1, "this$0"    # Lcom/vkontakte/android/statistics/StatisticBase;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->this$0:Lcom/vkontakte/android/statistics/StatisticBase;

    iput-object p2, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$sender:Lcom/vkontakte/android/statistics/StatisticSender;

    iput p3, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$retryCount:I

    iput-wide p4, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$retryTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->failCount:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 48
    invoke-static {}, Lcom/vkontakte/android/statistics/SentTable;->init()V

    .line 49
    iget-object v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->this$0:Lcom/vkontakte/android/statistics/StatisticBase;

    invoke-static {v1}, Lcom/vkontakte/android/statistics/StatisticBase;->access$000(Lcom/vkontakte/android/statistics/StatisticBase;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 52
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$sender:Lcom/vkontakte/android/statistics/StatisticSender;

    iget-object v2, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->this$0:Lcom/vkontakte/android/statistics/StatisticBase;

    invoke-interface {v1, v2}, Lcom/vkontakte/android/statistics/StatisticSender;->send(Lcom/vkontakte/android/statistics/StatisticBase;)Z

    move-result v0

    .line 53
    .local v0, "sent":Z
    if-nez v0, :cond_2

    iget v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->failCount:I

    iget v2, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$retryCount:I

    if-ge v1, v2, :cond_2

    .line 54
    iget v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->failCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->failCount:I

    .line 55
    iget-wide v2, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->val$retryTime:J

    invoke-static {p0, v2, v3}, Lcom/vkontakte/android/api/APIController;->runInBgDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 56
    :cond_2
    if-eqz v0, :cond_0

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$1;->this$0:Lcom/vkontakte/android/statistics/StatisticBase;

    invoke-static {v1}, Lcom/vkontakte/android/statistics/StatisticBase;->access$100(Lcom/vkontakte/android/statistics/StatisticBase;)V

    goto :goto_0
.end method
