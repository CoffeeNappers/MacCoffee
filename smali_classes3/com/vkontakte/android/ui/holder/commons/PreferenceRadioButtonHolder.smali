.class public Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PreferenceRadioButtonHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private checkedTextView:Landroid/widget/CheckedTextView;

.field private final listener:Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener",
            "<",
            "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener",
            "<",
            "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p2, "listener":Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;, "Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener<Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;>;"
    const v0, 0x7f0301e9

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 23
    const v0, 0x7f1001c3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckedTextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->checkedTextView:Landroid/widget/CheckedTextView;

    .line 24
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->listener:Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;

    .line 25
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->checkedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;->getEditTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    check-cast p1, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->onBind(Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->listener:Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->listener:Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder$OnRadioButtonClickListener;->onRadioButtonClick(Ljava/lang/Object;)V

    .line 42
    :cond_0
    return-void
.end method

.method public setChecked(Z)Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;
    .locals 1
    .param p1, "checked"    # Z

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/PreferenceRadioButtonHolder;->checkedTextView:Landroid/widget/CheckedTextView;

    invoke-virtual {v0, p1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 34
    return-object p0
.end method
