.class Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;
.super Landroid/widget/ArrayAdapter;
.source "BannedUserSettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;Landroid/content/Context;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # I

    .prologue
    .line 104
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-direct {p0, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 107
    if-eqz p2, :cond_0

    move-object v2, p2

    .line 108
    .local v2, "v":Landroid/view/View;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;

    .line 109
    .local v0, "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    const v3, 0x1020014

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    const v3, 0x1020015

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 111
    .local v1, "subtitle":Landroid/widget/TextView;
    iget-object v3, v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->subtitle:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 112
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 113
    iget-object v3, v0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->subtitle:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    :goto_1
    return-object v2

    .line 107
    .end local v0    # "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    .end local v1    # "subtitle":Landroid/widget/TextView;
    .end local v2    # "v":Landroid/view/View;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0301fe

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    goto :goto_0

    .line 115
    .restart local v0    # "opt":Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
    .restart local v1    # "subtitle":Landroid/widget/TextView;
    .restart local v2    # "v":Landroid/view/View;
    :cond_1
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method
