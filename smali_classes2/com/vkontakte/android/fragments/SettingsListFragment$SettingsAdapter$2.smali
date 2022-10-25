.class Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$2;
.super Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 313
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$2;->this$1:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;-><init>(Landroid/view/ViewGroup;)V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$2;->this$1:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->access$400(Lcom/vkontakte/android/fragments/SettingsListFragment;)V

    .line 317
    return-void
.end method
