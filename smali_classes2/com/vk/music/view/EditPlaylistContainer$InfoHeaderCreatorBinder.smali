.class Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;
.super Ljava/lang/Object;
.source "EditPlaylistContainer.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;
.implements Lcom/vkontakte/android/functions/VoidF;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/EditPlaylistContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InfoHeaderCreatorBinder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/functions/F1",
        "<",
        "Landroid/view/View;",
        "Landroid/view/ViewGroup;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidF;"
    }
.end annotation


# instance fields
.field currentDescription:Ljava/lang/String;

.field currentTitle:Ljava/lang/String;

.field description:Landroid/widget/EditText;

.field image:Lcom/vk/music/view/ThumbsImageView;

.field public onTitleTextChanged:Lcom/vkontakte/android/functions/VoidF;

.field final synthetic this$0:Lcom/vk/music/view/EditPlaylistContainer;

.field title:Landroid/widget/EditText;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 88
    iput-object p1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentDescription:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/EditPlaylistContainer;Lcom/vk/music/view/EditPlaylistContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/EditPlaylistContainer;
    .param p2, "x1"    # Lcom/vk/music/view/EditPlaylistContainer$1;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;-><init>(Lcom/vk/music/view/EditPlaylistContainer;)V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->invokeOnTextChanged()V

    return-void
.end method

.method private invokeOnTextChanged()V
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->onTitleTextChanged:Lcom/vkontakte/android/functions/VoidF;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->onTitleTextChanged:Lcom/vkontakte/android/functions/VoidF;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF;->f()V

    .line 164
    :cond_0
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    .line 98
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030130

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 99
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003cb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/ThumbsImageView;

    iput-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->image:Lcom/vk/music/view/ThumbsImageView;

    .line 100
    const v1, 0x7f1003cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/EditText;

    .line 101
    const v1, 0x7f1003cd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/EditText;

    .line 103
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/EditText;

    new-instance v2, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;

    invoke-direct {v2, p0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$1;-><init>(Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 118
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/EditText;

    new-instance v2, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$2;

    invoke-direct {v2, p0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder$2;-><init>(Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 134
    invoke-direct {p0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->invokeOnTextChanged()V

    .line 136
    return-object v0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 88
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->f(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public f()V
    .locals 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->image:Lcom/vk/music/view/ThumbsImageView;

    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/EditPlaylistModel;->getPhotoUrl()Lcom/vk/music/dto/Thumb;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 142
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v1, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentDescription:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentDescription:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 144
    return-void

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 143
    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/EditPlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/EditPlaylistContainer;->model:Lcom/vk/music/model/EditPlaylistModel;

    invoke-interface {v0}, Lcom/vk/music/model/EditPlaylistModel;->getDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method getDescription()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentDescription:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentDescription:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method getTitle()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->currentTitle:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method isTitleValid()Z
    .locals 1

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/vk/music/view/EditPlaylistContainer$InfoHeaderCreatorBinder;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
