.class final Lcom/vk/stories/model/StoriesContainer$1;
.super Ljava/lang/Object;
.source "StoriesContainer.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/model/StoriesContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/vk/stories/model/StoriesContainer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/vk/stories/model/StoriesContainer;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 175
    new-instance v0, Lcom/vk/stories/model/StoriesContainer;

    invoke-direct {v0, p1}, Lcom/vk/stories/model/StoriesContainer;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 172
    invoke-virtual {p0, p1}, Lcom/vk/stories/model/StoriesContainer$1;->createFromParcel(Landroid/os/Parcel;)Lcom/vk/stories/model/StoriesContainer;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/stories/model/StoriesContainer;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 180
    new-array v0, p1, [Lcom/vk/stories/model/StoriesContainer;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 172
    invoke-virtual {p0, p1}, Lcom/vk/stories/model/StoriesContainer$1;->newArray(I)[Lcom/vk/stories/model/StoriesContainer;

    move-result-object v0

    return-object v0
.end method
