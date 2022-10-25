.class Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "BoardTopicsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->toggleCloseTopic(Lcom/vkontakte/android/api/BoardTopic;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

.field final synthetic val$isClosed:Z

.field final synthetic val$topic:Lcom/vkontakte/android/api/BoardTopic;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;ZLcom/vkontakte/android/api/BoardTopic;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$isClosed:Z

    iput-object p4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$topic:Lcom/vkontakte/android/api/BoardTopic;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$isClosed:Z

    if-eqz v0, :cond_0

    const v0, 0x7f080715

    :goto_0
    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 197
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$isClosed:Z

    if-eqz v0, :cond_1

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$topic:Lcom/vkontakte/android/api/BoardTopic;

    iget v1, v0, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v1, v1, -0x2

    iput v1, v0, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    .line 202
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->updateList()V

    .line 203
    return-void

    .line 196
    :cond_0
    const v0, 0x7f08070f

    goto :goto_0

    .line 200
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;->val$topic:Lcom/vkontakte/android/api/BoardTopic;

    iget v1, v0, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    goto :goto_1
.end method
