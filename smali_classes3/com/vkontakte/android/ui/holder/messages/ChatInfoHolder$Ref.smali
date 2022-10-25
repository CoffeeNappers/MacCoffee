.class public Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;
.source "ChatInfoHolder.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Ref"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;",
        ">;",
        "Landroid/text/TextWatcher;"
    }
.end annotation


# instance fields
.field private enable:Z

.field private onClickListener:Landroid/view/View$OnClickListener;

.field private onEditorActionListener:Landroid/widget/TextView$OnEditorActionListener;

.field private photo:Ljava/lang/String;

.field private title:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;-><init>()V

    .line 23
    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onEditorActionListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 24
    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onClickListener:Landroid/view/View$OnClickListener;

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->enable:Z

    .line 26
    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->photo:Ljava/lang/String;

    return-void
.end method

.method static synthetic lambda$setPhoto$0(Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;Ljava/lang/String;)V
    .locals 1
    .param p0, "holder"    # Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 117
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 108
    return-void
.end method

.method protected bridge synthetic bind(Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;)V
    .locals 0
    .param p1    # Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 21
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->bind(Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;)V

    return-void
.end method

.method protected bind(Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 30
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 32
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->enable:Z

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onEditorActionListener:Landroid/widget/TextView$OnEditorActionListener;

    if-eqz v0, :cond_1

    .line 38
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onEditorActionListener:Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 41
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->enable:Z

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 42
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 43
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 44
    return-void
.end method

.method public clearImage()V
    .locals 1

    .prologue
    .line 87
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->setPhoto(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->title:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->title:Ljava/lang/CharSequence;

    goto :goto_0
.end method

.method public hasChatPhoto()Z
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->photo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->photo:Ljava/lang/String;

    const-string/jumbo v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 112
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->title:Ljava/lang/CharSequence;

    .line 113
    return-void
.end method

.method public setEnable(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->enable:Z

    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->getHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    .line 80
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    if-eqz v0, :cond_0

    .line 81
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v1, p1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 82
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 84
    :cond_0
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onClickListener:Landroid/view/View$OnClickListener;

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->getHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    .line 72
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_0

    .line 73
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, p1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    :cond_0
    return-void
.end method

.method public setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V
    .locals 2
    .param p1, "onEditorActionListener"    # Landroid/widget/TextView$OnEditorActionListener;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->onEditorActionListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 62
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->getHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    .line 63
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    if-eqz v0, :cond_0

    .line 64
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 66
    :cond_0
    return-void
.end method

.method public setPhoto(Ljava/lang/String;)V
    .locals 4
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->photo:Ljava/lang/String;

    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->getHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    .line 93
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    if-eqz v0, :cond_0

    .line 94
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 95
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 100
    :cond_0
    :goto_0
    return-void

    .line 97
    :cond_1
    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->title:Ljava/lang/CharSequence;

    .line 48
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->getHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    .line 49
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
    if-eqz v0, :cond_0

    .line 50
    iget-object v1, v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 52
    :cond_0
    return-void
.end method
