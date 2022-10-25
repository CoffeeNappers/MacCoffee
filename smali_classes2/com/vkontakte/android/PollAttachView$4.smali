.class Lcom/vkontakte/android/PollAttachView$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PollAttachView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PollAttachView;->unvote()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PollAttachView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PollAttachView;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PollAttachView;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 316
    iput-object p1, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 319
    const/4 v2, 0x0

    .line 320
    .local v2, "totalVotes":I
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v5

    array-length v6, v5

    move v3, v4

    :goto_0
    if-ge v3, v6, :cond_0

    aget-object v1, v5, v3

    .line 321
    .local v1, "opt":Lcom/vkontakte/android/api/PollOption;
    iget v7, v1, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    add-int/2addr v2, v7

    .line 320
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 323
    .end local v1    # "opt":Lcom/vkontakte/android/api/PollOption;
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    array-length v3, v3

    if-ge v0, v3, :cond_2

    .line 324
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget v3, v3, Lcom/vkontakte/android/api/PollOption;->id:I

    iget-object v5, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v5}, Lcom/vkontakte/android/PollAttachView;->access$000(Lcom/vkontakte/android/PollAttachView;)I

    move-result v5

    if-ne v3, v5, :cond_1

    .line 325
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget v5, v3, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    add-int/lit8 v5, v5, -0x1

    iput v5, v3, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    .line 327
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget-object v5, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v5}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v5

    aget-object v5, v5, v0

    iget v5, v5, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    int-to-float v5, v5

    int-to-float v6, v2

    div-float/2addr v5, v6

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float/2addr v5, v6

    iput v5, v3, Lcom/vkontakte/android/api/PollOption;->percent:F

    .line 323
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 329
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3, v4}, Lcom/vkontakte/android/PollAttachView;->access$002(Lcom/vkontakte/android/PollAttachView;I)I

    .line 330
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$600(Lcom/vkontakte/android/PollAttachView;)V

    .line 331
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$4;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$700(Lcom/vkontakte/android/PollAttachView;)V

    .line 332
    return-void
.end method
