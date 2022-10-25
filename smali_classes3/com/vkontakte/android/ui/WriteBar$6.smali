.class Lcom/vkontakte/android/ui/WriteBar$6;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 470
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$6;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 482
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$6;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 483
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$6;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3100(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$6;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/RichEditText;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RichEditText;->setText(Ljava/lang/CharSequence;)V

    .line 488
    :goto_0
    return-void

    .line 486
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$6;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->access$2800(Lcom/vkontakte/android/ui/WriteBar;Z)V

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 474
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 478
    return-void
.end method
