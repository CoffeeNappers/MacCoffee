.class public Lcom/vk/sharing/Picking$Builder;
.super Ljava/lang/Object;
.source "Picking.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/Picking;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/vk/sharing/Picking$Builder;->context:Landroid/content/Context;

    .line 21
    new-instance v0, Lcom/vk/sharing/picker/GroupPickerInfo;

    invoke-direct {v0}, Lcom/vk/sharing/picker/GroupPickerInfo;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/Picking$Builder;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    .line 24
    return-void
.end method

.method private createIntent()Landroid/content/Intent;
    .locals 3

    .prologue
    .line 46
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/sharing/Picking$Builder;->context:Landroid/content/Context;

    const-class v2, Lcom/vk/sharing/SharingActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "mode"

    const/4 v2, 0x1

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "picker_info"

    iget-object v2, p0, Lcom/vk/sharing/Picking$Builder;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    .line 48
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public adminedGroupId(I)Lcom/vk/sharing/Picking$Builder;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/sharing/Picking$Builder;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iput p1, v0, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    .line 38
    return-object p0
.end method

.method public pick(Landroid/app/Fragment;I)V
    .locals 1
    .param p1, "fragment"    # Landroid/app/Fragment;
    .param p2, "requestCode"    # I

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/vk/sharing/Picking$Builder;->createIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 43
    return-void
.end method

.method public preselectGroup(I)Lcom/vk/sharing/Picking$Builder;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/sharing/Picking$Builder;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iput p1, v0, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    .line 28
    return-object p0
.end method

.method public restrictToAdminedGroup()Lcom/vk/sharing/Picking$Builder;
    .locals 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/sharing/Picking$Builder;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vk/sharing/picker/GroupPickerInfo;->restrictToAdminedGroup:Z

    .line 33
    return-object p0
.end method
