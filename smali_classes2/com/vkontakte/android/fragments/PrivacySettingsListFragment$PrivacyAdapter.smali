.class Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$PrivacyAdapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "PrivacySettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PrivacyAdapter"
.end annotation


# static fields
.field static final TYPE_BOTTOM:I = 0x2

.field static final TYPE_SUMMARY:I = 0x1

.field static final TYPE_TITLE:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V
    .locals 0
    .param p1, "dataDelegate"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    .prologue
    .line 222
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V

    .line 223
    return-void
.end method


# virtual methods
.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 215
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$PrivacyAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 227
    packed-switch p2, :pswitch_data_0

    .line 234
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder;-><init>(Landroid/view/ViewGroup;)V

    :goto_0
    return-object v0

    .line 229
    :pswitch_1
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->blueTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    goto :goto_0

    .line 231
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 227
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
