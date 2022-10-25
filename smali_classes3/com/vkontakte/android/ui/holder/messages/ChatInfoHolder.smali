.class public Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;
.source "ChatInfoHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;",
        ">;"
    }
.end annotation


# instance fields
.field public final imageView:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final title:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final titleEdit:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "isCreate"    # Z

    .prologue
    .line 127
    if-eqz p2, :cond_0

    const v0, 0x7f03006b

    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;-><init>(ILandroid/content/Context;)V

    .line 129
    const v0, 0x7f10025c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->titleEdit:Landroid/widget/EditText;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 132
    const v0, 0x7f10025d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 134
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;->title:Landroid/widget/TextView;

    .line 135
    return-void

    .line 127
    :cond_0
    const v0, 0x7f03006a

    goto :goto_0
.end method
