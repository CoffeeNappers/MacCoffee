.class public Lcom/tonicartos/superslim/LayoutManager$SavedState;
.super Ljava/lang/Object;
.source "LayoutManager.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tonicartos/superslim/LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/tonicartos/superslim/LayoutManager$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public anchorOffset:I

.field public anchorPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2051
    new-instance v0, Lcom/tonicartos/superslim/LayoutManager$SavedState$1;

    invoke-direct {v0}, Lcom/tonicartos/superslim/LayoutManager$SavedState$1;-><init>()V

    sput-object v0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 2068
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2069
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 2071
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2072
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorPosition:I

    .line 2073
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorOffset:I

    .line 2074
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 2078
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 2083
    iget v0, p0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorPosition:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2084
    iget v0, p0, Lcom/tonicartos/superslim/LayoutManager$SavedState;->anchorOffset:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 2085
    return-void
.end method
