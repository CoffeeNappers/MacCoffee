.class public Lcom/vkontakte/android/ContactsSyncAdapterService$ExtendedUserProfile;
.super Lcom/vkontakte/android/UserProfile;
.source "ContactsSyncAdapterService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ContactsSyncAdapterService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtendedUserProfile"
.end annotation


# instance fields
.field bdate:Ljava/lang/String;

.field bigPhoto:Lcom/vkontakte/android/Photo;

.field nickname:Ljava/lang/String;

.field phone:Ljava/lang/String;

.field photoCropRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 618
    invoke-direct {p0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    return-void
.end method
