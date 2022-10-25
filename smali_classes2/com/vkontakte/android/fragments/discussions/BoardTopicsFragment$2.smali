.class Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "BoardTopicsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->deleteTopic(Lcom/vkontakte/android/api/BoardTopic;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

.field final synthetic val$topic:Lcom/vkontakte/android/api/BoardTopic;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;->val$topic:Lcom/vkontakte/android/api/BoardTopic;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->access$300(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;->val$topic:Lcom/vkontakte/android/api/BoardTopic;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->updateList()V

    .line 187
    return-void
.end method
