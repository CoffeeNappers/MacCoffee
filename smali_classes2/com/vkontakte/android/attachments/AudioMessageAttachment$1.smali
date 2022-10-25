.class Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;
.super Ljava/lang/Object;
.source "AudioMessageAttachment.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 108
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$400(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Landroid/content/Context;)V

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$502(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Z)Z

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$602(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/Float;)Ljava/lang/Float;

    .line 115
    return-void
.end method
