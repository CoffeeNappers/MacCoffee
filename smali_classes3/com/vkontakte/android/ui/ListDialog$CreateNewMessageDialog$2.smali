.class Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;
.super Ljava/lang/Object;
.source "ListDialog.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;->this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttached(Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V
    .locals 5
    .param p1, "adapter"    # Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    .prologue
    .line 295
    iget-object v1, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;->this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-static {v1, p1}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->access$102(Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    .line 296
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 297
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 298
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 299
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;->this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-static {v2}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->access$300(Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;)Landroid/content/BroadcastReceiver;

    move-result-object v2

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 300
    return-void
.end method

.method public onDetached(Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V
    .locals 2
    .param p1, "adapter"    # Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    .prologue
    .line 304
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;->this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->access$102(Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    .line 305
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$2;->this$0:Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-static {v1}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->access$300(Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;)Landroid/content/BroadcastReceiver;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 306
    return-void
.end method
