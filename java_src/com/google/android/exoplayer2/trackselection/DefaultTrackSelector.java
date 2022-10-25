package com.google.android.exoplayer2.trackselection;

import android.content.Context;
import android.graphics.Point;
import android.text.TextUtils;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.RendererCapabilities;
import com.google.android.exoplayer2.source.TrackGroup;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.trackselection.TrackSelection;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.Util;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class DefaultTrackSelector extends MappingTrackSelector {
    private static final float FRACTION_TO_CONSIDER_FULLSCREEN = 0.98f;
    private static final int[] NO_TRACKS = new int[0];
    private static final int WITHIN_RENDERER_CAPABILITIES_BONUS = 1000;
    private final TrackSelection.Factory adaptiveVideoTrackSelectionFactory;
    private final AtomicReference<Parameters> paramsReference;

    /* loaded from: classes.dex */
    public static final class Parameters {
        public final boolean allowMixedMimeAdaptiveness;
        public final boolean allowNonSeamlessAdaptiveness;
        public final boolean exceedRendererCapabilitiesIfNecessary;
        public final boolean exceedVideoConstraintsIfNecessary;
        public final int maxVideoHeight;
        public final int maxVideoWidth;
        public final boolean orientationMayChange;
        public final String preferredAudioLanguage;
        public final String preferredTextLanguage;
        public final int viewportHeight;
        public final int viewportWidth;

        public Parameters() {
            this(null, null, false, true, Integer.MAX_VALUE, Integer.MAX_VALUE, true, true, Integer.MAX_VALUE, Integer.MAX_VALUE, true);
        }

        public Parameters(String preferredAudioLanguage, String preferredTextLanguage, boolean allowMixedMimeAdaptiveness, boolean allowNonSeamlessAdaptiveness, int maxVideoWidth, int maxVideoHeight, boolean exceedVideoConstraintsIfNecessary, boolean exceedRendererCapabilitiesIfNecessary, int viewportWidth, int viewportHeight, boolean orientationMayChange) {
            this.preferredAudioLanguage = preferredAudioLanguage;
            this.preferredTextLanguage = preferredTextLanguage;
            this.allowMixedMimeAdaptiveness = allowMixedMimeAdaptiveness;
            this.allowNonSeamlessAdaptiveness = allowNonSeamlessAdaptiveness;
            this.maxVideoWidth = maxVideoWidth;
            this.maxVideoHeight = maxVideoHeight;
            this.exceedVideoConstraintsIfNecessary = exceedVideoConstraintsIfNecessary;
            this.exceedRendererCapabilitiesIfNecessary = exceedRendererCapabilitiesIfNecessary;
            this.viewportWidth = viewportWidth;
            this.viewportHeight = viewportHeight;
            this.orientationMayChange = orientationMayChange;
        }

        public Parameters withPreferredAudioLanguage(String preferredAudioLanguage) {
            String preferredAudioLanguage2 = Util.normalizeLanguageCode(preferredAudioLanguage);
            return TextUtils.equals(preferredAudioLanguage2, this.preferredAudioLanguage) ? this : new Parameters(preferredAudioLanguage2, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withPreferredTextLanguage(String preferredTextLanguage) {
            String preferredTextLanguage2 = Util.normalizeLanguageCode(preferredTextLanguage);
            return TextUtils.equals(preferredTextLanguage2, this.preferredTextLanguage) ? this : new Parameters(this.preferredAudioLanguage, preferredTextLanguage2, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withAllowMixedMimeAdaptiveness(boolean allowMixedMimeAdaptiveness) {
            return allowMixedMimeAdaptiveness == this.allowMixedMimeAdaptiveness ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withAllowNonSeamlessAdaptiveness(boolean allowNonSeamlessAdaptiveness) {
            return allowNonSeamlessAdaptiveness == this.allowNonSeamlessAdaptiveness ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withMaxVideoSize(int maxVideoWidth, int maxVideoHeight) {
            return (maxVideoWidth == this.maxVideoWidth && maxVideoHeight == this.maxVideoHeight) ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, maxVideoWidth, maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withMaxVideoSizeSd() {
            return withMaxVideoSize(1279, 719);
        }

        public Parameters withoutVideoSizeConstraints() {
            return withMaxVideoSize(Integer.MAX_VALUE, Integer.MAX_VALUE);
        }

        public Parameters withExceedVideoConstraintsIfNecessary(boolean exceedVideoConstraintsIfNecessary) {
            return exceedVideoConstraintsIfNecessary == this.exceedVideoConstraintsIfNecessary ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withExceedRendererCapabilitiesIfNecessary(boolean exceedRendererCapabilitiesIfNecessary) {
            return exceedRendererCapabilitiesIfNecessary == this.exceedRendererCapabilitiesIfNecessary ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, exceedRendererCapabilitiesIfNecessary, this.viewportWidth, this.viewportHeight, this.orientationMayChange);
        }

        public Parameters withViewportSize(int viewportWidth, int viewportHeight, boolean orientationMayChange) {
            return (viewportWidth == this.viewportWidth && viewportHeight == this.viewportHeight && orientationMayChange == this.orientationMayChange) ? this : new Parameters(this.preferredAudioLanguage, this.preferredTextLanguage, this.allowMixedMimeAdaptiveness, this.allowNonSeamlessAdaptiveness, this.maxVideoWidth, this.maxVideoHeight, this.exceedVideoConstraintsIfNecessary, this.exceedRendererCapabilitiesIfNecessary, viewportWidth, viewportHeight, orientationMayChange);
        }

        public Parameters withViewportSizeFromContext(Context context, boolean orientationMayChange) {
            Point viewportSize = Util.getPhysicalDisplaySize(context);
            return withViewportSize(viewportSize.x, viewportSize.y, orientationMayChange);
        }

        public Parameters withoutViewportSizeConstraints() {
            return withViewportSize(Integer.MAX_VALUE, Integer.MAX_VALUE, true);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            Parameters other = (Parameters) obj;
            return this.allowMixedMimeAdaptiveness == other.allowMixedMimeAdaptiveness && this.allowNonSeamlessAdaptiveness == other.allowNonSeamlessAdaptiveness && this.maxVideoWidth == other.maxVideoWidth && this.maxVideoHeight == other.maxVideoHeight && this.exceedVideoConstraintsIfNecessary == other.exceedVideoConstraintsIfNecessary && this.exceedRendererCapabilitiesIfNecessary == other.exceedRendererCapabilitiesIfNecessary && this.orientationMayChange == other.orientationMayChange && this.viewportWidth == other.viewportWidth && this.viewportHeight == other.viewportHeight && TextUtils.equals(this.preferredAudioLanguage, other.preferredAudioLanguage) && TextUtils.equals(this.preferredTextLanguage, other.preferredTextLanguage);
        }

        public int hashCode() {
            int i = 1;
            int result = this.preferredAudioLanguage.hashCode();
            int hashCode = ((((((((((((((result * 31) + this.preferredTextLanguage.hashCode()) * 31) + (this.allowMixedMimeAdaptiveness ? 1 : 0)) * 31) + (this.allowNonSeamlessAdaptiveness ? 1 : 0)) * 31) + this.maxVideoWidth) * 31) + this.maxVideoHeight) * 31) + (this.exceedVideoConstraintsIfNecessary ? 1 : 0)) * 31) + (this.exceedRendererCapabilitiesIfNecessary ? 1 : 0)) * 31;
            if (!this.orientationMayChange) {
                i = 0;
            }
            int result2 = hashCode + i;
            return (((result2 * 31) + this.viewportWidth) * 31) + this.viewportHeight;
        }
    }

    public DefaultTrackSelector() {
        this(null);
    }

    public DefaultTrackSelector(TrackSelection.Factory adaptiveVideoTrackSelectionFactory) {
        this.adaptiveVideoTrackSelectionFactory = adaptiveVideoTrackSelectionFactory;
        this.paramsReference = new AtomicReference<>(new Parameters());
    }

    public void setParameters(Parameters params) {
        Assertions.checkNotNull(params);
        if (!this.paramsReference.getAndSet(params).equals(params)) {
            invalidate();
        }
    }

    public Parameters getParameters() {
        return this.paramsReference.get();
    }

    @Override // com.google.android.exoplayer2.trackselection.MappingTrackSelector
    protected TrackSelection[] selectTracks(RendererCapabilities[] rendererCapabilities, TrackGroupArray[] rendererTrackGroupArrays, int[][][] rendererFormatSupports) throws ExoPlaybackException {
        TrackSelection[] rendererTrackSelections = new TrackSelection[rendererCapabilities.length];
        Parameters params = this.paramsReference.get();
        for (int i = 0; i < rendererCapabilities.length; i++) {
            switch (rendererCapabilities[i].getTrackType()) {
                case 1:
                    rendererTrackSelections[i] = selectAudioTrack(rendererTrackGroupArrays[i], rendererFormatSupports[i], params.preferredAudioLanguage, params.exceedRendererCapabilitiesIfNecessary);
                    break;
                case 2:
                    rendererTrackSelections[i] = selectVideoTrack(rendererCapabilities[i], rendererTrackGroupArrays[i], rendererFormatSupports[i], params.maxVideoWidth, params.maxVideoHeight, params.allowNonSeamlessAdaptiveness, params.allowMixedMimeAdaptiveness, params.viewportWidth, params.viewportHeight, params.orientationMayChange, this.adaptiveVideoTrackSelectionFactory, params.exceedVideoConstraintsIfNecessary, params.exceedRendererCapabilitiesIfNecessary);
                    break;
                case 3:
                    rendererTrackSelections[i] = selectTextTrack(rendererTrackGroupArrays[i], rendererFormatSupports[i], params.preferredTextLanguage, params.preferredAudioLanguage, params.exceedRendererCapabilitiesIfNecessary);
                    break;
                default:
                    rendererTrackSelections[i] = selectOtherTrack(rendererCapabilities[i].getTrackType(), rendererTrackGroupArrays[i], rendererFormatSupports[i], params.exceedRendererCapabilitiesIfNecessary);
                    break;
            }
        }
        return rendererTrackSelections;
    }

    protected TrackSelection selectVideoTrack(RendererCapabilities rendererCapabilities, TrackGroupArray groups, int[][] formatSupport, int maxVideoWidth, int maxVideoHeight, boolean allowNonSeamlessAdaptiveness, boolean allowMixedMimeAdaptiveness, int viewportWidth, int viewportHeight, boolean orientationMayChange, TrackSelection.Factory adaptiveVideoTrackSelectionFactory, boolean exceedConstraintsIfNecessary, boolean exceedRendererCapabilitiesIfNecessary) throws ExoPlaybackException {
        TrackSelection selection = null;
        if (adaptiveVideoTrackSelectionFactory != null) {
            selection = selectAdaptiveVideoTrack(rendererCapabilities, groups, formatSupport, maxVideoWidth, maxVideoHeight, allowNonSeamlessAdaptiveness, allowMixedMimeAdaptiveness, viewportWidth, viewportHeight, orientationMayChange, adaptiveVideoTrackSelectionFactory);
        }
        if (selection == null) {
            TrackSelection selection2 = selectFixedVideoTrack(groups, formatSupport, maxVideoWidth, maxVideoHeight, viewportWidth, viewportHeight, orientationMayChange, exceedConstraintsIfNecessary, exceedRendererCapabilitiesIfNecessary);
            return selection2;
        }
        return selection;
    }

    private static TrackSelection selectAdaptiveVideoTrack(RendererCapabilities rendererCapabilities, TrackGroupArray groups, int[][] formatSupport, int maxVideoWidth, int maxVideoHeight, boolean allowNonSeamlessAdaptiveness, boolean allowMixedMimeAdaptiveness, int viewportWidth, int viewportHeight, boolean orientationMayChange, TrackSelection.Factory adaptiveVideoTrackSelectionFactory) throws ExoPlaybackException {
        int requiredAdaptiveSupport = allowNonSeamlessAdaptiveness ? 12 : 8;
        boolean allowMixedMimeTypes = allowMixedMimeAdaptiveness && (rendererCapabilities.supportsMixedMimeTypeAdaptation() & requiredAdaptiveSupport) != 0;
        for (int i = 0; i < groups.length; i++) {
            TrackGroup group = groups.get(i);
            int[] adaptiveTracks = getAdaptiveTracksForGroup(group, formatSupport[i], allowMixedMimeTypes, requiredAdaptiveSupport, maxVideoWidth, maxVideoHeight, viewportWidth, viewportHeight, orientationMayChange);
            if (adaptiveTracks.length > 0) {
                return adaptiveVideoTrackSelectionFactory.mo377createTrackSelection(group, adaptiveTracks);
            }
        }
        return null;
    }

    private static int[] getAdaptiveTracksForGroup(TrackGroup group, int[] formatSupport, boolean allowMixedMimeTypes, int requiredAdaptiveSupport, int maxVideoWidth, int maxVideoHeight, int viewportWidth, int viewportHeight, boolean orientationMayChange) {
        if (group.length < 2) {
            return NO_TRACKS;
        }
        List<Integer> selectedTrackIndices = getViewportFilteredTrackIndices(group, viewportWidth, viewportHeight, orientationMayChange);
        if (selectedTrackIndices.size() < 2) {
            return NO_TRACKS;
        }
        String selectedMimeType = null;
        if (!allowMixedMimeTypes) {
            HashSet<String> seenMimeTypes = new HashSet<>();
            int selectedMimeTypeTrackCount = 0;
            for (int i = 0; i < selectedTrackIndices.size(); i++) {
                int trackIndex = selectedTrackIndices.get(i).intValue();
                String sampleMimeType = group.getFormat(trackIndex).sampleMimeType;
                if (!seenMimeTypes.contains(sampleMimeType)) {
                    seenMimeTypes.add(sampleMimeType);
                    int countForMimeType = getAdaptiveTrackCountForMimeType(group, formatSupport, requiredAdaptiveSupport, sampleMimeType, maxVideoWidth, maxVideoHeight, selectedTrackIndices);
                    if (countForMimeType > selectedMimeTypeTrackCount) {
                        selectedMimeType = sampleMimeType;
                        selectedMimeTypeTrackCount = countForMimeType;
                    }
                }
            }
        }
        filterAdaptiveTrackCountForMimeType(group, formatSupport, requiredAdaptiveSupport, selectedMimeType, maxVideoWidth, maxVideoHeight, selectedTrackIndices);
        return selectedTrackIndices.size() < 2 ? NO_TRACKS : Util.toArray(selectedTrackIndices);
    }

    private static int getAdaptiveTrackCountForMimeType(TrackGroup group, int[] formatSupport, int requiredAdaptiveSupport, String mimeType, int maxVideoWidth, int maxVideoHeight, List<Integer> selectedTrackIndices) {
        int adaptiveTrackCount = 0;
        for (int i = 0; i < selectedTrackIndices.size(); i++) {
            int trackIndex = selectedTrackIndices.get(i).intValue();
            if (isSupportedAdaptiveVideoTrack(group.getFormat(trackIndex), mimeType, formatSupport[trackIndex], requiredAdaptiveSupport, maxVideoWidth, maxVideoHeight)) {
                adaptiveTrackCount++;
            }
        }
        return adaptiveTrackCount;
    }

    private static void filterAdaptiveTrackCountForMimeType(TrackGroup group, int[] formatSupport, int requiredAdaptiveSupport, String mimeType, int maxVideoWidth, int maxVideoHeight, List<Integer> selectedTrackIndices) {
        for (int i = selectedTrackIndices.size() - 1; i >= 0; i--) {
            int trackIndex = selectedTrackIndices.get(i).intValue();
            if (!isSupportedAdaptiveVideoTrack(group.getFormat(trackIndex), mimeType, formatSupport[trackIndex], requiredAdaptiveSupport, maxVideoWidth, maxVideoHeight)) {
                selectedTrackIndices.remove(i);
            }
        }
    }

    private static boolean isSupportedAdaptiveVideoTrack(Format format, String mimeType, int formatSupport, int requiredAdaptiveSupport, int maxVideoWidth, int maxVideoHeight) {
        if (!isSupported(formatSupport, false) || (formatSupport & requiredAdaptiveSupport) == 0) {
            return false;
        }
        if (mimeType != null && !Util.areEqual(format.sampleMimeType, mimeType)) {
            return false;
        }
        if (format.width != -1 && format.width > maxVideoWidth) {
            return false;
        }
        return format.height == -1 || format.height <= maxVideoHeight;
    }

    private static TrackSelection selectFixedVideoTrack(TrackGroupArray groups, int[][] formatSupport, int maxVideoWidth, int maxVideoHeight, int viewportWidth, int viewportHeight, boolean orientationMayChange, boolean exceedConstraintsIfNecessary, boolean exceedRendererCapabilitiesIfNecessary) {
        int comparisonResult;
        TrackGroup selectedGroup = null;
        int selectedTrackIndex = 0;
        int selectedTrackScore = 0;
        int selectedBitrate = -1;
        int selectedPixelCount = -1;
        for (int groupIndex = 0; groupIndex < groups.length; groupIndex++) {
            TrackGroup trackGroup = groups.get(groupIndex);
            List<Integer> selectedTrackIndices = getViewportFilteredTrackIndices(trackGroup, viewportWidth, viewportHeight, orientationMayChange);
            int[] trackFormatSupport = formatSupport[groupIndex];
            for (int trackIndex = 0; trackIndex < trackGroup.length; trackIndex++) {
                if (isSupported(trackFormatSupport[trackIndex], exceedRendererCapabilitiesIfNecessary)) {
                    Format format = trackGroup.getFormat(trackIndex);
                    boolean isWithinConstraints = selectedTrackIndices.contains(Integer.valueOf(trackIndex)) && (format.width == -1 || format.width <= maxVideoWidth) && (format.height == -1 || format.height <= maxVideoHeight);
                    if (isWithinConstraints || exceedConstraintsIfNecessary) {
                        int trackScore = isWithinConstraints ? 2 : 1;
                        if (isSupported(trackFormatSupport[trackIndex], false)) {
                            trackScore += 1000;
                        }
                        boolean selectTrack = trackScore > selectedTrackScore;
                        if (trackScore == selectedTrackScore) {
                            int formatPixelCount = format.getPixelCount();
                            if (formatPixelCount != selectedPixelCount) {
                                comparisonResult = compareFormatValues(format.getPixelCount(), selectedPixelCount);
                            } else {
                                comparisonResult = compareFormatValues(format.bitrate, selectedBitrate);
                            }
                            if (isWithinConstraints) {
                                selectTrack = comparisonResult > 0;
                            } else {
                                selectTrack = comparisonResult < 0;
                            }
                        }
                        if (selectTrack) {
                            selectedGroup = trackGroup;
                            selectedTrackIndex = trackIndex;
                            selectedTrackScore = trackScore;
                            selectedBitrate = format.bitrate;
                            selectedPixelCount = format.getPixelCount();
                        }
                    }
                }
            }
        }
        if (selectedGroup == null) {
            return null;
        }
        return new FixedTrackSelection(selectedGroup, selectedTrackIndex);
    }

    private static int compareFormatValues(int first, int second) {
        if (first == -1) {
            return second == -1 ? 0 : -1;
        } else if (second != -1) {
            return first - second;
        } else {
            return 1;
        }
    }

    protected TrackSelection selectAudioTrack(TrackGroupArray groups, int[][] formatSupport, String preferredAudioLanguage, boolean exceedRendererCapabilitiesIfNecessary) {
        int trackScore;
        TrackGroup selectedGroup = null;
        int selectedTrackIndex = 0;
        int selectedTrackScore = 0;
        for (int groupIndex = 0; groupIndex < groups.length; groupIndex++) {
            TrackGroup trackGroup = groups.get(groupIndex);
            int[] trackFormatSupport = formatSupport[groupIndex];
            for (int trackIndex = 0; trackIndex < trackGroup.length; trackIndex++) {
                if (isSupported(trackFormatSupport[trackIndex], exceedRendererCapabilitiesIfNecessary)) {
                    Format format = trackGroup.getFormat(trackIndex);
                    boolean isDefault = (format.selectionFlags & 1) != 0;
                    if (formatHasLanguage(format, preferredAudioLanguage)) {
                        if (isDefault) {
                            trackScore = 4;
                        } else {
                            trackScore = 3;
                        }
                    } else if (isDefault) {
                        trackScore = 2;
                    } else {
                        trackScore = 1;
                    }
                    if (isSupported(trackFormatSupport[trackIndex], false)) {
                        trackScore += 1000;
                    }
                    if (trackScore > selectedTrackScore) {
                        selectedGroup = trackGroup;
                        selectedTrackIndex = trackIndex;
                        selectedTrackScore = trackScore;
                    }
                }
            }
        }
        if (selectedGroup == null) {
            return null;
        }
        return new FixedTrackSelection(selectedGroup, selectedTrackIndex);
    }

    protected TrackSelection selectTextTrack(TrackGroupArray groups, int[][] formatSupport, String preferredTextLanguage, String preferredAudioLanguage, boolean exceedRendererCapabilitiesIfNecessary) {
        int trackScore;
        TrackGroup selectedGroup = null;
        int selectedTrackIndex = 0;
        int selectedTrackScore = 0;
        for (int groupIndex = 0; groupIndex < groups.length; groupIndex++) {
            TrackGroup trackGroup = groups.get(groupIndex);
            int[] trackFormatSupport = formatSupport[groupIndex];
            for (int trackIndex = 0; trackIndex < trackGroup.length; trackIndex++) {
                if (isSupported(trackFormatSupport[trackIndex], exceedRendererCapabilitiesIfNecessary)) {
                    Format format = trackGroup.getFormat(trackIndex);
                    boolean isDefault = (format.selectionFlags & 1) != 0;
                    boolean isForced = (format.selectionFlags & 2) != 0;
                    if (formatHasLanguage(format, preferredTextLanguage)) {
                        if (isDefault) {
                            trackScore = 6;
                        } else if (!isForced) {
                            trackScore = 5;
                        } else {
                            trackScore = 4;
                        }
                    } else if (isDefault) {
                        trackScore = 3;
                    } else if (isForced) {
                        if (formatHasLanguage(format, preferredAudioLanguage)) {
                            trackScore = 2;
                        } else {
                            trackScore = 1;
                        }
                    }
                    int selectedTrackScore2 = isSupported(trackFormatSupport[trackIndex], false) ? trackScore + 1000 : trackScore;
                    if (selectedTrackScore2 > selectedTrackScore) {
                        selectedGroup = trackGroup;
                        selectedTrackIndex = trackIndex;
                        selectedTrackScore = selectedTrackScore2;
                    }
                }
            }
        }
        if (selectedGroup == null) {
            return null;
        }
        return new FixedTrackSelection(selectedGroup, selectedTrackIndex);
    }

    protected TrackSelection selectOtherTrack(int trackType, TrackGroupArray groups, int[][] formatSupport, boolean exceedRendererCapabilitiesIfNecessary) {
        TrackGroup selectedGroup = null;
        int selectedTrackIndex = 0;
        int selectedTrackScore = 0;
        for (int groupIndex = 0; groupIndex < groups.length; groupIndex++) {
            TrackGroup trackGroup = groups.get(groupIndex);
            int[] trackFormatSupport = formatSupport[groupIndex];
            for (int trackIndex = 0; trackIndex < trackGroup.length; trackIndex++) {
                if (isSupported(trackFormatSupport[trackIndex], exceedRendererCapabilitiesIfNecessary)) {
                    Format format = trackGroup.getFormat(trackIndex);
                    boolean isDefault = (format.selectionFlags & 1) != 0;
                    int trackScore = isDefault ? 2 : 1;
                    if (isSupported(trackFormatSupport[trackIndex], false)) {
                        trackScore += 1000;
                    }
                    if (trackScore > selectedTrackScore) {
                        selectedGroup = trackGroup;
                        selectedTrackIndex = trackIndex;
                        selectedTrackScore = trackScore;
                    }
                }
            }
        }
        if (selectedGroup == null) {
            return null;
        }
        return new FixedTrackSelection(selectedGroup, selectedTrackIndex);
    }

    protected static boolean isSupported(int formatSupport, boolean allowExceedsCapabilities) {
        int maskedSupport = formatSupport & 3;
        return maskedSupport == 3 || (allowExceedsCapabilities && maskedSupport == 2);
    }

    protected static boolean formatHasLanguage(Format format, String language) {
        return language != null && language.equals(Util.normalizeLanguageCode(format.language));
    }

    private static List<Integer> getViewportFilteredTrackIndices(TrackGroup group, int viewportWidth, int viewportHeight, boolean orientationMayChange) {
        ArrayList<Integer> selectedTrackIndices = new ArrayList<>(group.length);
        for (int i = 0; i < group.length; i++) {
            selectedTrackIndices.add(Integer.valueOf(i));
        }
        if (viewportWidth != Integer.MAX_VALUE && viewportHeight != Integer.MAX_VALUE) {
            int maxVideoPixelsToRetain = Integer.MAX_VALUE;
            for (int i2 = 0; i2 < group.length; i2++) {
                Format format = group.getFormat(i2);
                if (format.width > 0 && format.height > 0) {
                    Point maxVideoSizeInViewport = getMaxVideoSizeInViewport(orientationMayChange, viewportWidth, viewportHeight, format.width, format.height);
                    int videoPixels = format.width * format.height;
                    if (format.width >= ((int) (maxVideoSizeInViewport.x * FRACTION_TO_CONSIDER_FULLSCREEN)) && format.height >= ((int) (maxVideoSizeInViewport.y * FRACTION_TO_CONSIDER_FULLSCREEN)) && videoPixels < maxVideoPixelsToRetain) {
                        maxVideoPixelsToRetain = videoPixels;
                    }
                }
            }
            if (maxVideoPixelsToRetain != Integer.MAX_VALUE) {
                for (int i3 = selectedTrackIndices.size() - 1; i3 >= 0; i3--) {
                    int pixelCount = group.getFormat(selectedTrackIndices.get(i3).intValue()).getPixelCount();
                    if (pixelCount == -1 || pixelCount > maxVideoPixelsToRetain) {
                        selectedTrackIndices.remove(i3);
                    }
                }
            }
        }
        return selectedTrackIndices;
    }

    private static Point getMaxVideoSizeInViewport(boolean orientationMayChange, int viewportWidth, int viewportHeight, int videoWidth, int videoHeight) {
        boolean z = true;
        if (orientationMayChange) {
            boolean z2 = videoWidth > videoHeight;
            if (viewportWidth <= viewportHeight) {
                z = false;
            }
            if (z2 != z) {
                viewportWidth = viewportHeight;
                viewportHeight = viewportWidth;
            }
        }
        if (videoWidth * viewportHeight >= videoHeight * viewportWidth) {
            return new Point(viewportWidth, Util.ceilDivide(viewportWidth * videoHeight, videoWidth));
        }
        return new Point(Util.ceilDivide(viewportHeight * videoWidth, videoHeight), viewportHeight);
    }
}
