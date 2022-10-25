.class Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$1;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
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
.method constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;Landroid/view/View;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 303
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$1;->this$1:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onBind(Ljava/lang/Object;)V
    .locals 0
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 306
    return-void
.end method
