.class public abstract Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.super Ljava/lang/Object;
.source "Serializer.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;
.implements Lcom/vkontakte/android/utils/Serializer$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/Serializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CreatorAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<TT;>;",
        "Lcom/vkontakte/android/utils/Serializer$Creator",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    .local p0, "this":Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;, "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Parcel;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;, "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter<TT;>;"
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->get(Landroid/os/Parcel;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
