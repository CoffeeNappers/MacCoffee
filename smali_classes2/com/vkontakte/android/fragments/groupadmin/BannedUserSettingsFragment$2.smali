.class Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$2;
.super Ljava/lang/Object;
.source "BannedUserSettingsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$2;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$100(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)V

    .line 162
    return-void
.end method
