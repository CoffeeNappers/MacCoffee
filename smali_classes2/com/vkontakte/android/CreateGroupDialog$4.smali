.class Lcom/vkontakte/android/CreateGroupDialog$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "CreateGroupDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/CreateGroupDialog;->createGroup(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/CreateGroupDialog;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/CreateGroupDialog;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/CreateGroupDialog;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/vkontakte/android/CreateGroupDialog$4;->this$0:Lcom/vkontakte/android/CreateGroupDialog;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/Group;)V
    .locals 1
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 143
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/vkontakte/android/data/Groups;->addGroup(Lcom/vkontakte/android/api/Group;Z)V

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/CreateGroupDialog$4;->this$0:Lcom/vkontakte/android/CreateGroupDialog;

    invoke-virtual {v0}, Lcom/vkontakte/android/CreateGroupDialog;->dismiss()V

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/CreateGroupDialog$4;->this$0:Lcom/vkontakte/android/CreateGroupDialog;

    invoke-static {v0, p1}, Lcom/vkontakte/android/CreateGroupDialog;->access$200(Lcom/vkontakte/android/CreateGroupDialog;Lcom/vkontakte/android/api/Group;)V

    .line 146
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 140
    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/CreateGroupDialog$4;->success(Lcom/vkontakte/android/api/Group;)V

    return-void
.end method
