.class Lcom/vkontakte/android/fragments/PostViewFragment$11$1;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$11;->onTextFromClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PostViewFragment$11;

.field final synthetic val$builder:Lcom/vk/sharing/Picking$Builder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$11;Lcom/vk/sharing/Picking$Builder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PostViewFragment$11;

    .prologue
    .line 839
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$11;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;->val$builder:Lcom/vk/sharing/Picking$Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 842
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;->val$builder:Lcom/vk/sharing/Picking$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$11;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/16 v2, 0x10eb

    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/Picking$Builder;->pick(Landroid/app/Fragment;I)V

    .line 843
    return-void
.end method
