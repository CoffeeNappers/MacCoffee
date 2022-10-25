.class Lcom/vkontakte/android/fragments/PostViewFragment$9;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 782
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$9;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sendGraffiti(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V
    .locals 1
    .param p1, "graffiti"    # Lcom/vkontakte/android/attachments/GraffitiAttachment;

    .prologue
    .line 785
    instance-of v0, p1, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v0, :cond_0

    .line 786
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$9;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    check-cast p1, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local p1    # "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1500(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/attachments/PendingAttachment;)V

    .line 790
    :goto_0
    return-void

    .line 788
    .restart local p1    # "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$9;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1600(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_0
.end method
