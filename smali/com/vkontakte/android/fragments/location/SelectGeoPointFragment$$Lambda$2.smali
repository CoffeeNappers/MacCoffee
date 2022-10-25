.class final synthetic Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;

.field private final arg$2:Lcom/vkontakte/android/attachments/GeoAttachment;

.field private final arg$3:Landroid/app/ProgressDialog;

.field private final arg$4:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/app/ProgressDialog;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$2:Lcom/vkontakte/android/attachments/GeoAttachment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$3:Landroid/app/ProgressDialog;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$4:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/app/ProgressDialog;Landroid/app/Activity;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/app/ProgressDialog;Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$2:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$3:Landroid/app/ProgressDialog;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$2;->arg$4:Landroid/app/Activity;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;->lambda$onDone$5(Lcom/vkontakte/android/attachments/GeoAttachment;Landroid/app/ProgressDialog;Landroid/app/Activity;)V

    return-void
.end method
