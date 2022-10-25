.class final synthetic Lcom/patloew/rxlocation/Geocoding$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/Geocoding;

.field private final arg$2:Ljava/util/Locale;

.field private final arg$3:Landroid/location/Location;

.field private final arg$4:I


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iput-object p2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$2:Ljava/util/Locale;

    iput-object p3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$3:Landroid/location/Location;

    iput p4, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$4:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)Ljava/util/concurrent/Callable;
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;-><init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)V

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$2:Ljava/util/Locale;

    iget-object v2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$3:Landroid/location/Location;

    iget v3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$1;->arg$4:I

    invoke-static {v0, v1, v2, v3}, Lcom/patloew/rxlocation/Geocoding;->lambda$fromLocation$1(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Landroid/location/Location;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
