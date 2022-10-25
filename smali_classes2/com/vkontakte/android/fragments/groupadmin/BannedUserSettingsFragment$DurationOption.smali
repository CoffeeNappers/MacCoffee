.class Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;
.super Ljava/lang/Object;
.source "BannedUserSettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DurationOption"
.end annotation


# instance fields
.field subtitle:Ljava/lang/String;

.field time:I

.field title:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$1;

    .prologue
    .line 285
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$DurationOption;->title:Ljava/lang/String;

    return-object v0
.end method
