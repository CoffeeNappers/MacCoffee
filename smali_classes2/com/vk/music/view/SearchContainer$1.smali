.class Lcom/vk/music/view/SearchContainer$1;
.super Lcom/vkontakte/android/EditEmptyChangeListener;
.source "SearchContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/SearchContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/view/SearchContainer;

.field final synthetic val$voiceSearchAvailable:Z


# direct methods
.method constructor <init>(Lcom/vk/music/view/SearchContainer;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/view/SearchContainer;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/vk/music/view/SearchContainer$1;->this$0:Lcom/vk/music/view/SearchContainer;

    iput-boolean p2, p0, Lcom/vk/music/view/SearchContainer$1;->val$voiceSearchAvailable:Z

    invoke-direct {p0}, Lcom/vkontakte/android/EditEmptyChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onEmptyChanged(Z)V
    .locals 2
    .param p1, "isEmpty"    # Z

    .prologue
    .line 214
    iget-boolean v0, p0, Lcom/vk/music/view/SearchContainer$1;->val$voiceSearchAvailable:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 215
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$1;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 219
    :goto_0
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$1;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v1, v0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    const v0, 0x7f020157

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 220
    return-void

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer$1;->this$0:Lcom/vk/music/view/SearchContainer;

    iget-object v0, v0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 219
    :cond_1
    const v0, 0x7f020354

    goto :goto_1
.end method
