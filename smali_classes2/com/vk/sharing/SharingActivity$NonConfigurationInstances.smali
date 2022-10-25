.class final Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
.super Ljava/lang/Object;
.source "SharingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NonConfigurationInstances"
.end annotation


# instance fields
.field private attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

.field private targetsLoader:Lcom/vk/sharing/target/TargetsLoader;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/sharing/SharingActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/sharing/SharingActivity$1;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;)Lcom/vk/sharing/target/TargetsLoader;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;Lcom/vk/sharing/target/TargetsLoader;)Lcom/vk/sharing/target/TargetsLoader;
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
    .param p1, "x1"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;)Lcom/vk/sharing/attachment/AttachmentViewHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;Lcom/vk/sharing/attachment/AttachmentViewHolder;)Lcom/vk/sharing/attachment/AttachmentViewHolder;
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
    .param p1, "x1"    # Lcom/vk/sharing/attachment/AttachmentViewHolder;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    return-object p1
.end method
