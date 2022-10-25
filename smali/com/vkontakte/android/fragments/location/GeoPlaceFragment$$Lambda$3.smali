.class final synthetic Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;-><init>(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->lambda$null$0(Landroid/content/DialogInterface;I)V

    return-void
.end method
