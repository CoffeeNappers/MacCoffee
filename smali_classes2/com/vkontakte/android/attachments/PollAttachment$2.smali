.class Lcom/vkontakte/android/attachments/PollAttachment$2;
.super Ljava/lang/Object;
.source "PollAttachment.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PollAttachment;->bindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PollAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PollAttachment$2;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$2;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    iget v0, v0, Lcom/vkontakte/android/attachments/PollAttachment;->userAnswer:I

    if-eqz v0, :cond_0

    .line 138
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PollAttachment$2;->this$0:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {v1, v0}, Lcom/vkontakte/android/attachments/PollAttachment;->access$100(Lcom/vkontakte/android/attachments/PollAttachment;Landroid/view/ViewGroup;)V

    .line 139
    const/4 v0, 0x1

    .line 141
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
