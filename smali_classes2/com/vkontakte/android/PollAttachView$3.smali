.class Lcom/vkontakte/android/PollAttachView$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PollAttachView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PollAttachView;->vote(Lcom/vkontakte/android/api/PollOption;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PollAttachView;

.field final synthetic val$opt:Lcom/vkontakte/android/api/PollOption;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PollAttachView;Landroid/content/Context;Lcom/vkontakte/android/api/PollOption;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PollAttachView;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    iput-object p3, p0, Lcom/vkontakte/android/PollAttachView$3;->val$opt:Lcom/vkontakte/android/api/PollOption;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 7

    .prologue
    .line 295
    const/4 v2, 0x1

    .line 296
    .local v2, "totalVotes":I
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView$3;->val$opt:Lcom/vkontakte/android/api/PollOption;

    iget v4, v4, Lcom/vkontakte/android/api/PollOption;->id:I

    invoke-static {v3, v4}, Lcom/vkontakte/android/PollAttachView;->access$002(Lcom/vkontakte/android/PollAttachView;I)I

    .line 297
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v5, :cond_0

    aget-object v1, v4, v3

    .line 298
    .local v1, "opt":Lcom/vkontakte/android/api/PollOption;
    iget v6, v1, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    add-int/2addr v2, v6

    .line 297
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 300
    .end local v1    # "opt":Lcom/vkontakte/android/api/PollOption;
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    array-length v3, v3

    if-ge v0, v3, :cond_2

    .line 301
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget v3, v3, Lcom/vkontakte/android/api/PollOption;->id:I

    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView$3;->val$opt:Lcom/vkontakte/android/api/PollOption;

    iget v4, v4, Lcom/vkontakte/android/api/PollOption;->id:I

    if-ne v3, v4, :cond_1

    .line 302
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget v4, v3, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    .line 304
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v3

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v4}, Lcom/vkontakte/android/PollAttachView;->access$500(Lcom/vkontakte/android/PollAttachView;)[Lcom/vkontakte/android/api/PollOption;

    move-result-object v4

    aget-object v4, v4, v0

    iget v4, v4, Lcom/vkontakte/android/api/PollOption;->numVotes:I

    int-to-float v4, v4

    int-to-float v5, v2

    div-float/2addr v4, v5

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v4, v5

    iput v4, v3, Lcom/vkontakte/android/api/PollOption;->percent:F

    .line 300
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 306
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$600(Lcom/vkontakte/android/PollAttachView;)V

    .line 307
    iget-object v3, p0, Lcom/vkontakte/android/PollAttachView$3;->this$0:Lcom/vkontakte/android/PollAttachView;

    invoke-static {v3}, Lcom/vkontakte/android/PollAttachView;->access$700(Lcom/vkontakte/android/PollAttachView;)V

    .line 308
    return-void
.end method
