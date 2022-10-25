package com.vkontakte.android;

import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
/* loaded from: classes2.dex */
public class ZhukovLayout {
    public static final float HORIZONTAL_SPACING = 2.0f;
    public static final float VERTICAL_SPACING = 2.0f;

    public static void processThumbs(int maxW, int maxH, List<Attachment> attachments) {
        float max_w;
        float max_h;
        int h;
        int w;
        char orient;
        ArrayList<ThumbAttachment> thumbs = new ArrayList<>();
        for (Attachment att : attachments) {
            if (att instanceof ThumbAttachment) {
                thumbs.add((ThumbAttachment) att);
            }
        }
        if (thumbs.size() != 0) {
            String orients = "";
            int[] orients_cnt = new int[3];
            ArrayList<Float> ratios = new ArrayList<>();
            int cnt = thumbs.size();
            boolean bad = false;
            Iterator<ThumbAttachment> it = thumbs.iterator();
            while (it.hasNext()) {
                ThumbAttachment thumb = it.next();
                float ratio = thumb.getRatio();
                if (ratio == -1.0f) {
                    bad = true;
                }
                if (ratio > 1.2d) {
                    orient = 'w';
                } else {
                    orient = ((double) ratio) < 0.8d ? 'n' : 'q';
                }
                orients = orients + orient;
                int oi = oi(orient);
                orients_cnt[oi] = orients_cnt[oi] + 1;
                ratios.add(Float.valueOf(ratio));
            }
            if (bad) {
                Log.e("vk", "BAD!");
                Iterator<ThumbAttachment> it2 = thumbs.iterator();
                while (it2.hasNext()) {
                    ThumbAttachment t = it2.next();
                    t.setViewSize(Global.scale(135.0f), Global.scale(100.0f), false, false);
                }
                return;
            }
            float avg_ratio = !ratios.isEmpty() ? sum(ratios) / ratios.size() : 1.0f;
            float margin_w = Global.scale(2.0f);
            float margin_h = Global.scale(2.0f);
            if (maxW > 0) {
                max_w = maxW;
                max_h = maxH;
            } else {
                max_w = 320.0f;
                max_h = 210.0f;
            }
            float max_ratio = max_w / max_h;
            if (cnt == 1) {
                float max_w2 = Math.min(max_w, Global.scale(thumbs.get(0).getWidth('x')));
                if (ratios.get(0).floatValue() > 0.5d) {
                    thumbs.get(0).setViewSize(max_w2, max_w2 / ratios.get(0).floatValue(), true, false);
                } else {
                    thumbs.get(0).setViewSize(max_w2, 2.0f * max_w2, true, false);
                }
            } else if (cnt == 2) {
                if (orients.equals("ww") && avg_ratio > 1.4d * max_ratio && ratios.get(1).floatValue() - ratios.get(0).floatValue() < 0.2d) {
                    float w2 = max_w;
                    float h2 = Math.min(w2 / ratios.get(0).floatValue(), Math.min(w2 / ratios.get(1).floatValue(), (max_h - margin_h) / 2.0f));
                    thumbs.get(0).setViewSize(w2, h2, true, false);
                    thumbs.get(1).setViewSize(w2, h2, false, false);
                } else if (orients.equals("ww") || orients.equals("qq")) {
                    float w3 = (max_w - margin_w) / 2.0f;
                    float h3 = Math.min(w3 / ratios.get(0).floatValue(), Math.min(w3 / ratios.get(1).floatValue(), max_h));
                    thumbs.get(0).setViewSize(w3, h3, false, false);
                    thumbs.get(1).setViewSize(w3, h3, false, false);
                } else {
                    float w0 = ((max_w - margin_w) / ratios.get(1).floatValue()) / ((1.0f / ratios.get(1).floatValue()) + (1.0f / ratios.get(0).floatValue()));
                    float w1 = (max_w - w0) - margin_w;
                    float h4 = Math.min(max_h, Math.min(w0 / ratios.get(0).floatValue(), w1 / ratios.get(1).floatValue()));
                    thumbs.get(0).setViewSize(w0, h4, false, false);
                    thumbs.get(1).setViewSize(w1, h4, false, false);
                }
            } else if (cnt == 3) {
                if (orients.equals("www")) {
                    float w4 = max_w;
                    float h_cover = Math.min(w4 / ratios.get(0).floatValue(), (max_h - margin_h) * 0.66f);
                    thumbs.get(0).setViewSize(w4, h_cover, true, false);
                    float w5 = (max_w - margin_w) / 2.0f;
                    float h5 = Math.min((max_h - h_cover) - margin_h, Math.min(w5 / ratios.get(1).floatValue(), w5 / ratios.get(2).floatValue()));
                    thumbs.get(1).setViewSize(w5, h5, false, false);
                    thumbs.get(2).setViewSize(w5, h5, false, false);
                    return;
                }
                int h6 = (int) max_h;
                int w_cover = (int) Math.min(ratios.get(0).floatValue() * h6, (max_w - margin_w) * 0.75d);
                thumbs.get(0).setViewSize(w_cover, h6, false, false);
                float h1 = ((max_h - margin_h) * ratios.get(1).floatValue()) / (ratios.get(1).floatValue() + ratios.get(2).floatValue());
                float h0 = (max_h - h1) - margin_h;
                float w6 = Math.min((max_w - w_cover) - margin_w, Math.min(h1 * ratios.get(2).floatValue(), ratios.get(1).floatValue() * h0));
                thumbs.get(1).setViewSize(w6, h0, false, true);
                thumbs.get(2).setViewSize(w6, h1, false, true);
            } else if (cnt == 4) {
                if (orients.equals("wwww")) {
                    int h_cover2 = (int) Math.min(w / ratios.get(0).floatValue(), (max_h - margin_h) * 0.66d);
                    thumbs.get(0).setViewSize((int) max_w, h_cover2, true, false);
                    int h7 = (int) ((max_w - (2.0f * margin_w)) / (ratios.get(3).floatValue() + (ratios.get(1).floatValue() + ratios.get(2).floatValue())));
                    int w02 = (int) (ratios.get(1).floatValue() * h7);
                    int w12 = (int) (ratios.get(2).floatValue() * h7);
                    int w22 = (int) (ratios.get(3).floatValue() * h7);
                    int h8 = (int) Math.min((max_h - h_cover2) - margin_h, h7);
                    thumbs.get(1).setViewSize(w02, h8, false, false);
                    thumbs.get(2).setViewSize(w12, h8, false, false);
                    thumbs.get(3).setViewSize(w22, h8, false, false);
                    return;
                }
                int w_cover2 = (int) Math.min(ratios.get(0).floatValue() * h, (max_w - margin_w) * 0.66d);
                thumbs.get(0).setViewSize(w_cover2, (int) max_h, false, false);
                int w7 = (int) ((max_h - (2.0f * margin_h)) / ((1.0f / ratios.get(3).floatValue()) + ((1.0f / ratios.get(1).floatValue()) + (1.0f / ratios.get(2).floatValue()))));
                int h02 = (int) (w7 / ratios.get(1).floatValue());
                int h12 = (int) (w7 / ratios.get(2).floatValue());
                int h22 = (int) ((w7 / ratios.get(3).floatValue()) + margin_h);
                int w8 = (int) Math.min((max_w - w_cover2) - margin_w, w7);
                thumbs.get(1).setViewSize(w8, h02, false, true);
                thumbs.get(2).setViewSize(w8, h12, false, true);
                thumbs.get(3).setViewSize(w8, h22, false, true);
            } else {
                ArrayList<Float> ratios_cropped = new ArrayList<>();
                if (avg_ratio > 1.1d) {
                    Iterator<Float> it3 = ratios.iterator();
                    while (it3.hasNext()) {
                        float ratio2 = it3.next().floatValue();
                        ratios_cropped.add(Float.valueOf(Math.max(1.0f, ratio2)));
                    }
                } else {
                    Iterator<Float> it4 = ratios.iterator();
                    while (it4.hasNext()) {
                        float ratio3 = it4.next().floatValue();
                        ratios_cropped.add(Float.valueOf(Math.min(1.0f, ratio3)));
                    }
                }
                HashMap<String, float[]> tries = new HashMap<>();
                tries.put(cnt + "", new float[]{calculateMultiThumbsHeight(ratios_cropped, max_w, margin_w)});
                for (int first_line = 1; first_line <= cnt - 1; first_line++) {
                    int second_line = cnt - first_line;
                    tries.put(first_line + "," + second_line, new float[]{calculateMultiThumbsHeight(ratios_cropped.subList(0, first_line), max_w, margin_w), calculateMultiThumbsHeight(ratios_cropped.subList(first_line, ratios_cropped.size()), max_w, margin_w)});
                }
                for (int first_line2 = 1; first_line2 <= cnt - 2; first_line2++) {
                    for (int second_line2 = 1; second_line2 <= (cnt - first_line2) - 1; second_line2++) {
                        int third_line = (cnt - first_line2) - second_line2;
                        tries.put(first_line2 + "," + second_line2 + "," + third_line, new float[]{calculateMultiThumbsHeight(ratios_cropped.subList(0, first_line2), max_w, margin_w), calculateMultiThumbsHeight(ratios_cropped.subList(first_line2, first_line2 + second_line2), max_w, margin_w), calculateMultiThumbsHeight(ratios_cropped.subList(first_line2 + second_line2, ratios_cropped.size()), max_w, margin_w)});
                    }
                }
                String opt_conf = null;
                float opt_diff = 0.0f;
                Set<String> keys = tries.keySet();
                for (String conf : keys) {
                    float[] heights = tries.get(conf);
                    float conf_h = margin_h * (heights.length - 1);
                    for (float h9 : heights) {
                        conf_h += h9;
                    }
                    float conf_diff = Math.abs(conf_h - max_h);
                    if (conf.indexOf(44) != -1) {
                        String[] conf_nums = conf.split(",");
                        if (Integer.parseInt(conf_nums[0]) > Integer.parseInt(conf_nums[1]) || (conf_nums.length > 2 && Integer.parseInt(conf_nums[1]) > Integer.parseInt(conf_nums[2]))) {
                            conf_diff = (float) (conf_diff * 1.1d);
                        }
                    }
                    if (opt_conf == null || conf_diff < opt_diff) {
                        opt_conf = conf;
                        opt_diff = conf_diff;
                    }
                }
                ArrayList<ThumbAttachment> thumbs_remain = (ArrayList) thumbs.clone();
                ArrayList<Float> ratios_remain = (ArrayList) ratios_cropped.clone();
                String[] chunks = opt_conf.split(",");
                float[] opt_heights = tries.get(opt_conf);
                int length = chunks.length - 1;
                int k = 0;
                for (String str : chunks) {
                    int line_chunks_num = Integer.parseInt(str);
                    ArrayList<ThumbAttachment> line_thumbs = new ArrayList<>();
                    for (int j = 0; j < line_chunks_num; j++) {
                        line_thumbs.add(thumbs_remain.remove(0));
                    }
                    float line_height = opt_heights[k];
                    k++;
                    int last_column = line_thumbs.size() - 1;
                    int j2 = 0;
                    while (j2 < line_thumbs.size()) {
                        ThumbAttachment thumb2 = line_thumbs.get(j2);
                        float thumb_ratio = ratios_remain.remove(0).floatValue();
                        thumb2.setViewSize((int) (thumb_ratio * line_height), (int) line_height, j2 == last_column, false);
                        j2++;
                    }
                }
            }
        }
    }

    private static int oi(char o) {
        switch (o) {
            case 'n':
                return 1;
            case 'q':
                return 2;
            case 'w':
            default:
                return 0;
        }
    }

    private static float sum(List<Float> a) {
        float sum = 0.0f;
        for (Float f : a) {
            float f2 = f.floatValue();
            sum += f2;
        }
        return sum;
    }

    private static float calculateMultiThumbsHeight(List<Float> ratios, float width, float margin) {
        return (width - ((ratios.size() - 1) * margin)) / sum(ratios);
    }
}
