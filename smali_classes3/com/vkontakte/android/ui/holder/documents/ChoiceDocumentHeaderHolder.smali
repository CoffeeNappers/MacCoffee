.class public Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ChoiceDocumentHeaderHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "v"    # Landroid/view/ViewGroup;

    .prologue
    .line 13
    const v0, 0x7f030070

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 14
    const v0, 0x7f100263

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    const v0, 0x7f100264

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 20
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 10
    check-cast p1, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->onBind(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 32
    :goto_0
    return-void

    .line 26
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->choiceDocFromGallery()V

    goto :goto_0

    .line 29
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/ChoiceDocumentHeaderHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->choiceDocFromStorage()V

    goto :goto_0

    .line 24
    :pswitch_data_0
    .packed-switch 0x7f100263
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
