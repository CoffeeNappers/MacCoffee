.class Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;
.super Ljava/lang/Object;
.source "SettingsAccountInnerFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;->lambda$onCreate$5(Landroid/support/v7/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

.field final synthetic val$rbForAdmined:Landroid/widget/RadioButton;

.field final synthetic val$rbForAll:Landroid/widget/RadioButton;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;Landroid/widget/RadioButton;Landroid/widget/RadioButton;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;->this$0:Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;->val$rbForAll:Landroid/widget/RadioButton;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;->val$rbForAdmined:Landroid/widget/RadioButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;->val$rbForAll:Landroid/widget/RadioButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsAccountInnerFragment$1;->val$rbForAdmined:Landroid/widget/RadioButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 106
    return-void
.end method
