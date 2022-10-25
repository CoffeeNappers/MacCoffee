.class Lcom/vkontakte/android/attachments/PollAttachment$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PollAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PollAttachment;->unvote(Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PollAttachment;

.field final synthetic val$wrap:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PollAttachment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iput-object p3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->val$wrap:Landroid/view/ViewGroup;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 7

    .prologue
    .line 193
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    const/4 v4, -0x1

    iput v4, v3, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    .line 194
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    .line 195
    .local v2, "opt":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v5, v4, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    iget v6, v2, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    add-int/2addr v5, v6

    iput v5, v4, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    goto :goto_0

    .line 197
    .end local v2    # "opt":Lcom/vkontakte/android/attachments/PollAttachment$Answer;
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 198
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    iget v3, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    iget-object v4, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v4, v4, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    if-ne v3, v4, :cond_1

    .line 199
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    iget v4, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    .line 201
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PollAttachment;->answers:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    iget v4, v4, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v5, v5, Lcom/vkontakte/android/attachments/PollAttachment;->numVotes:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v4, v5

    iput v4, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    .line 197
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 203
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    const/4 v4, 0x0

    iput v4, v3, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    .line 204
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v4, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->val$wrap:Landroid/view/ViewGroup;

    invoke-static {v3, v4}, Lcom/vkontakte/android/attachments/PollAttachment;->access$200(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;)V

    .line 205
    const/4 v1, 0x0

    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->val$wrap:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 206
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->val$wrap:Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 207
    .local v0, "c":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/vkontakte/android/attachments/PollAttachment$Answer;

    if-eqz v3, :cond_3

    .line 208
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    const/4 v4, 0x1

    invoke-static {v3, v0, v4}, Lcom/vkontakte/android/attachments/PollAttachment;->access$300(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/View;Z)V

    .line 205
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 211
    .end local v0    # "c":Landroid/view/View;
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PollAttachment$4;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-static {v3}, Lcom/vkontakte/android/attachments/PollAttachment;->access$400(Lcom/vkontakte/android/attachments/PollAttachment;)V

    .line 212
    return-void
.end method
