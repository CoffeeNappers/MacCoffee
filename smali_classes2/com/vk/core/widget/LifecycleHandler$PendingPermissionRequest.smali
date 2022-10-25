.class Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;
.super Ljava/lang/Object;
.source "LifecycleHandler.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/widget/LifecycleHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingPermissionRequest"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final instanceId:Ljava/lang/String;

.field final permissions:[Ljava/lang/String;

.field final requestCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 347
    new-instance v0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest$1;

    invoke-direct {v0}, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest$1;-><init>()V

    sput-object v0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->instanceId:Ljava/lang/String;

    .line 331
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->permissions:[Ljava/lang/String;

    .line 332
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->requestCode:I

    .line 333
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/core/widget/LifecycleHandler$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/core/widget/LifecycleHandler$1;

    .prologue
    .line 318
    invoke-direct {p0, p1}, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 0
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I

    .prologue
    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 324
    iput-object p1, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->instanceId:Ljava/lang/String;

    .line 325
    iput-object p2, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->permissions:[Ljava/lang/String;

    .line 326
    iput p3, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->requestCode:I

    .line 327
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 342
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->instanceId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->permissions:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 344
    iget v0, p0, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->requestCode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 345
    return-void
.end method
